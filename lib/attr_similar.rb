require_relative 'attr_similar/similarity_matching'
require_relative 'attr_similar/version'

module AttrSimilar
  extend ActiveSupport::Concern

  module ClassMethods
    def attr_similar(threshold_or_thresholds, *attributes)
      if threshold_or_thresholds.is_a?(Array) && threshold_or_thresholds.size != attributes.size
        raise 'Threshold count must equal number of attributes'
      end
      define_method :find_first_similar do |scope|
        AttrSimilar::SimilarityMatching.find_first_similar(scope, self, threshold_or_thresholds, attributes)
      end
    end
  end
end
 
ActiveRecord::Base.send :include, AttrSimilar

