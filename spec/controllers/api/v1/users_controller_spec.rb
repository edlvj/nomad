RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create :user }
  
  before do
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'GET #show' do
    context 'when user found' do
      before do
        get :show, params: { id: user.id }
      end
      it 'assigns user' do
        expect(assigns(:user)).to eq(user)
      end
      it 'renders the :show template' do
        expect(response).to be_success
      end
    end
  end
  
end