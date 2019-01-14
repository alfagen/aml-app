# frozen_string_literal: true

FactoryBot.define do
  factory(:user, class: User) do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user#{n}" }

    association :aml_operator, factory: :aml_operator
  end
end
