module AttrSimilar
  module SimilarityMatching
    def self.find_first_similar(scope, entity, threshold_or_thresholds, attributes)
      # Only consider attributes on entity with non-blank values
      filtered_attributes = attributes.select { |attribute| !entity.send(attribute).blank? }
      return nil if filtered_attributes.size == 0

      # Use single threshold or threshold determined by number of filtered attributes
      threshold = if threshold_or_thresholds.is_a?(Array)
        threshold_or_thresholds[filtered_attributes.size - 1]
      else
        threshold_or_thresholds
      end

      scope = scope.where('id != ?', entity.id) if entity.id

      # Build up per-attribute entity lists and candidate entity list
      per_attribute_entity_lists, candidate_entities = filtered_attributes.inject([[], []]) do |memo, attribute|
        entities = scope.where(attribute => entity.send(attribute))
        if entities.size > 0
          memo[0].concat([entities])   # Add to per_attribute_entity_lists
          memo[1].concat(entities)     # Add to candidate_entities
        end
        memo
      end

      # No similar entities if count of per-attribute entity lists is below threshold
      return nil if per_attribute_entity_lists.size < threshold

      per_attribute_entity_id_lists = per_attribute_entity_lists.map { |list| list.map(&:id) }

      candidate_entity_map = candidate_entities.inject({}) do |map, candidate_entity|
        map[candidate_entity.id] = candidate_entity
        map
      end
      candidate_entity_ids = candidate_entity_map.keys

      # Find entities that are in at least "threshold" lists
      candidate_entity_ids.each do |candidate_entity_id|
        count = per_attribute_entity_id_lists.reduce(0) do |count, list|
          count += list.include?(candidate_entity_id) ? 1 : 0
        end
        return candidate_entity_map[candidate_entity_id] if count >= threshold
      end

      # No similar entities
      nil
    end
  end
end

