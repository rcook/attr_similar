require 'test_helper'

class AttrSimilarTest < ActiveSupport::TestCase
  test 'find similar with five matching attributes' do
    existing_widget = create(:widget)
    new_widget = build(
      :widget,
      :address => existing_widget.address,
      :birthdate => existing_widget.birthdate,
      :first_name => existing_widget.first_name,
      :last_name => existing_widget.last_name,
      :preferred_name => existing_widget.preferred_name
    )
    assert_equal existing_widget, new_widget.find_first_similar(Widget)
  end

  test 'find similar with four matching attributes' do
    existing_widget = create(:widget)
    new_widget = build(
      :widget,
      :address => existing_widget.address,
      :first_name => existing_widget.first_name,
      :last_name => existing_widget.last_name,
      :preferred_name => existing_widget.preferred_name
    )
    assert_equal existing_widget, new_widget.find_first_similar(Widget)
  end

  test 'find similar with three matching attributes' do
    existing_widget = create(:widget)
    new_widget = build(
      :widget,
      :address => existing_widget.address,
      :first_name => existing_widget.first_name,
      :last_name => existing_widget.last_name
    )
    assert_equal existing_widget, new_widget.find_first_similar(Widget)
  end

  test 'find similar with two matching attributes' do
    existing_widget = create(:widget)
    new_widget = build(
      :widget,
      :address => existing_widget.address,
      :first_name => existing_widget.first_name
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'find similar with one matching attribute' do
    existing_widget = create(:widget)
    new_widget = build(
      :widget,
      :address => existing_widget.address
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'find similar with no matching attributes' do
    existing_widget = create(:widget)
    new_widget = create(:widget)
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'find similar multiple widgets' do
    existing_widget1 = create(:widget)
    existing_widget2 = create(:widget)
    new_widget = create(
      :widget,
      :address => existing_widget2.address,
      :first_name => existing_widget2.first_name,
      :last_name => existing_widget2.last_name
    )
    assert_equal existing_widget2, new_widget.find_first_similar(Widget)
  end

  test 'case 0' do
    existing_widget = create(
      :widget,
      :address => '',
      :birthdate => nil,
      :first_name => 'Not John',
      :last_name => '',
      :preferred_name => ''
    )
    new_widget = build(
      :widget,
      :address => '',
      :birthdate => nil,
      :first_name => 'John',
      :last_name => '',
      :preferred_name => ''
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'case 1' do
    existing_widget = create(
      :widget,
      :address => 'blah',
      :birthdate => random_date,
      :first_name => 'John',
      :last_name => 'blah',
      :preferred_name => 'blah'
    )
    new_widget = build(
      :widget,
      :address => '',
      :birthdate => nil,
      :first_name => 'John',
      :last_name => '',
      :preferred_name => ''
    )
    assert_equal existing_widget, new_widget.find_first_similar(Widget)
  end

  test 'case 2' do
    existing_widget = create(
      :widget,
      :address => 'blah',
      :birthdate => random_date,
      :first_name => 'Not John',
      :last_name => 'blah',
      :preferred_name => 'blah'
    )
    new_widget = build(
      :widget,
      :address => '',
      :birthdate => nil,
      :first_name => 'John',
      :last_name => '',
      :preferred_name => ''
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'case 3' do
    existing_widget = create(
      :widget,
      :address => 'blah',
      :birthdate => random_date,
      :first_name => 'John',
      :last_name => 'Doe',
      :preferred_name => 'blah'
    )
    new_widget = build(
      :widget,
      :address => '',
      :birthdate => nil,
      :first_name => 'John',
      :last_name => 'Smith',
      :preferred_name => ''
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'case 3a' do
    existing_widget = create(
      :widget,
      :address => nil,
      :birthdate => nil,
      :first_name => 'Calvin',
      :last_name => 'Hobbes',
      :preferred_name => nil
    )
    new_widget = build(
      :widget,
      :address => nil,
      :birthdate => nil,
      :first_name => 'Homer',
      :last_name => 'Simpson',
      :preferred_name => nil
    )
    assert_nil new_widget.find_first_similar(Widget)
  end

  test 'case 4' do
    existing_widget = create(
      :widget,
      :address => '123 Main St',
      :birthdate => random_date,
      :first_name => 'John',
      :last_name => 'Doe',
      :preferred_name => 'blah'
    )
    new_widget = build(
      :widget,
      :address => '123 Main St',
      :birthdate => nil,
      :first_name => 'John',
      :last_name => 'Smith',
      :preferred_name => ''
    )
    assert_equal existing_widget, new_widget.find_first_similar(Widget)
  end

  test 'case 5' do
    existing_widget = create(
      :widget,
      :address => '123 Main St',
      :birthdate => random_date,
      :first_name => 'John',
      :last_name => 'Doe',
      :preferred_name => 'blah'
    )
    new_widget = build(
      :widget,
      :address => nil,
      :birthdate => nil,
      :first_name => nil,
      :last_name => nil,
      :preferred_name => nil
    )
    assert_nil new_widget.find_first_similar(Widget)
  end
end

