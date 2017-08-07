RSpec.describe 'RatingMutation', type: :request do
  subject { create :city, :with_country }
  let(:user) { create :user}
  let(:auth_headers) { user.create_new_auth_token }
 
  describe 'Create' do

    it 'save rating' do
      graphql_request %|
        mutation {
          addRating(input: {city_id: "#{subject.id}", rate: 3, rate_type: "fun" }) {
            rating{
              id
            }
          }
        }|, headers: auth_headers
     
      expect(response).to have_http_status(:ok)
    end
  end

end  