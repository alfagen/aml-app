require 'rails_helper'

RSpec.describe DocumentKindFieldDefinitionsController, type: :controller do
  describe '#base actions' do
    let(:user) { create(:user) }
    let(:document_kind) { create(:document_kind) }
    let(:document_kind_field_definition) { create(:document_kind_field_definition) }

    before { login_user(user) }

    context 'with registered user' do
      it '#create' do
        post :create, params: { document_kind_field_definition: attributes_for(:document_kind_field_definition,
                                                                               document_kind_id: document_kind.id) }
        expect(response).to be_redirect
      end

      it '#update' do
        put :update, params: { document_kind_field_definition: { key: 'newkey',
                                                                 title: 'newtitle',
                                                                 document_kind_id: document_kind.id },
                               id: document_kind_field_definition.id }
        expect(response).to be_redirect
      end
    end
  end
end
