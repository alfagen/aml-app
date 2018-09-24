FactoryBot.define do
  factory(:order, class: AML::Order) do
    first_name { 'First name' }
    surname { 'Surname' }
    patronymic { 'patronymic' }
    birth_date { Time.zone.today - 30.years }
    client
    operator
  end

  trait :processing do
    workflow_state { 'processing' }
  end
end
