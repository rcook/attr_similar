FactoryGirl.define do
  factory :widget do
    sequence(:address) { |n| "address-#{'%05d' % n}" }
    birthdate { TestHelper.random_date }
    sequence(:first_name) { |n| "first-name-#{'%05d' % n}" }
    sequence(:last_name) { |n| "last-name-#{'%05d' % n}" }
    sequence(:preferred_name) { |n| "preferred-name-#{'%05d' % n}" }
  end
end

