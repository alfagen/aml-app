FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    crypted_password { 'MyString' }
    salt { 'MyString' }
    sequence(:name) { |n| "user#{n}" }

    trait :operator do
      association :aml_operator, factory: :aml_operator
    end
  end
end
