require 'rails_helper'

RSpec.describe LocalesController, type: :controller do
  describe '#update' do
    context 'with registered user' do
      let(:aml_operator) { create :aml_operator }

      before { login_user(aml_operator) }

      it 'изменение локали на другую' do
        # ru по умолчанию
        expect(I18n.locale).to eq(:ru)
        put 'update', params: { locale: :en }
        expect(I18n.locale).to eq(:en)
      end
    end
  end
end
