FactoryBot.define do
  factory(:client, class: Aml::Client) do
    name 'Name'
    sequence(:inn) { |n| n }
  end
end
