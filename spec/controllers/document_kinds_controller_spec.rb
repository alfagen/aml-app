require 'rails_helper'

RSpec.describe DocumentKindsController, type: :controller do
  describe '#create' do
    context 'with registered user' do
      let(:user) { create(:user) }
      let(:document_kind) { create(:document_kind) }

      before { login_user(user) }

      subject { post 'create', params: { document_kind: attributes_for(:document_kind) } }

      it 'saves the new document kind to database' do
        expect { subject }.to change(DocumentKind.all, :count).by(1)
      end

      it 'redirects to show view' do
        expect(subject).to redirect_to(action: :index)
      end

      it 'should respond with a success status code (2xx)' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#index' do
    let(:user) { create(:user) }
    let(:document_kind) { create(:document_kind) }

    before { login_user(user) }

    subject { get :index }

    it { is_expected.to render_template(:index) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
