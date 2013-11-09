require 'test_helper'

class AttrSimilarTest < ActiveSupport::TestCase
  test 'find_first_similar' do
    w1 = create(
      :widget,
      :address => 'address',
      :birthdate => '1970-01-01',
      :first_name => 'first-name',
      :last_name => 'last-name',
      :preferred_name => 'preferred_name'
    )
    w2 = build(
      :widget,
      :address => 'address',
      :birthdate => '1970-01-01',
      :first_name => 'first-name',
      :last_name => 'last-name',
      :preferred_name => 'preferred_name'
    )
    assert_equal w1, w2.find_first_similar(Widget)
  end
end

