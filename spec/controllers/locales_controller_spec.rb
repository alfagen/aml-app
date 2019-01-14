require 'rails_helper'

RSpec.describe LocalesController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:operator) { create :aml_operator }
      let(:user) { create :user, aml_operator: operator }

      before { login_user user }

      it 'изменение локали на другую' do
        locale = I18n.locale
        another_locale = (I18n.available_locales - [locale]).sample || :en
        put 'update', params: { locale: another_locale }
        expect(I18n.locale).to eq(another_locale)
      end
    end
  end
end
