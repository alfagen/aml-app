# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    role 'operator'
    workflow_state 'unblocked'
    password 'password'
    password_confirmation 'password'
    salt { 'ExqpVWiDcK2vGfeRjqTx' }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('password', salt) }
  end
end
