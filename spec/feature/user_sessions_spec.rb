require 'rails_helper'

feature 'Оператор не залогинен' do
  background { visit root_path }

  scenario 'оператор должен видеть форму для ввода имени пользователя и пароля' do
    expect(page).to have_css 'form#new_user_session'
  end
end
