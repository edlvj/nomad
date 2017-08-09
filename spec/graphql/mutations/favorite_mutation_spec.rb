RSpec.describe 'FavoriteMutation', type: :request do
  subject { create :city, :with_country }
  let(:user) { create :user}
  let(:auth_headers) { user.create_new_auth_token }
 
  describe 'Create' do

    it 'save favorite' do
      graphql_request %|
        mutation {
          addFavorite(input: {city_id: "#{subject.id}", visited: true }) {
            favorite{
              id
            }
          }
        }|, headers: auth_headers
      expect(response).to have_http_status(:ok)
    end
  end

end  