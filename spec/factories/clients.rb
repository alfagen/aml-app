FactoryBot.define do
  factory(:client, class: AML::Client) do
    name 'Name'
    sequence(:inn) { |n| n }
  end
end
