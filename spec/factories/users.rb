FactoryBot.define do
  factory(:user, class: User) do
    sequence(:email) { |n| "mail#{n}@mail.com" }
    crypted_password { 'password' }
    salt { 'awdfaasdzalsfjlajh' }
  end
end
