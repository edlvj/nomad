RSpec.describe Api::V1::RatingsController, type: :controller do
  subject { create :city, :with_country }
  let(:user) { create :user }
  
  before do
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
  
  describe 'POST #create' do
    let(:valid_params) do
      { rating: attributes_for(:rating, city_id: subject.id) }
    end

    it 'returns a successful 200 response' do
      post :create, params: valid_params
      expect(response).to be_success
    end
    
    it 'create new task' do
      expect { post :create, params: valid_params }
        .to change { Rating.count }.by(1)
    end
  end
end