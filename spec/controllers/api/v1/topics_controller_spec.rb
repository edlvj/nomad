RSpec.describe Api::V1::TopicsController, type: :controller do
  subject { create :topic, :with_city}
  let(:user) { create :user }
  let(:city) { create :city, :with_country }
  
  before do
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'GET #show' do
    context 'when topic found' do
      before do
        get :show, params: { id: subject.id }
      end
      it 'assigns topic' do
        expect(assigns(:topic)).to eq(subject)
      end
      it 'renders the :show template' do
        expect(response).to be_success
      end
    end
  end
  
  
  describe 'POST #create' do
    let(:valid_params) do
      { topic: attributes_for(:topic, city_id: city.id) }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    
    it 'create new task' do
      expect { post :create, params: valid_params }
        .to change { Topic.count }.by(1)
    end
  end
end