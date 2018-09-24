FactoryBot.define do
  factory(:client, class: AML::Client) do
    first_name { 'Name' }
    surname { 'Surname' }
    patronymic { 'Patronymic' }
    birth_date { Date.today - 20.years }
    workflow_state { :none }
    aml_status
  end
end
