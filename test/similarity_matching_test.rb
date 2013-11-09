require 'test_helper'

class SimilarityMatchingTest < ActiveSupport::TestCase
  test 'sample_method true' do
    assert AttrSimilar::SimilarityMatching.sample_method(true)
  end

  test 'sample_method false' do
    assert !AttrSimilar::SimilarityMatching.sample_method(false)
  end
end

