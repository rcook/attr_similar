require_relative 'attr_similar/similarity_matching'
require_relative 'attr_similar/version'

module AttrSimilar
  extend ActiveSupport::Concern

  module ClassMethods
    def attr_similar(attributes)
      self.similar_attributes = attributes
    end

    def similar_attributes
      @@similar_attributes ||= []
    end

    def similar_attributes=(value)
      @@similar_attributes = value
    end
  end

  included do
  end

  def sample_method
    AttrSimilar::SimilarityMatching.sample_method(self.class.similar_attributes)
  end
end
 
ActiveRecord::Base.send :include, AttrSimilar

