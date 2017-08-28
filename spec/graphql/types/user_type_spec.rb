RSpec.describe 'UserType', type: :request do

  describe 'Show' do
    before do 
      @city = create :city, :with_country
      @user = create :user
      @favorite = create(:favorite, user_id: @user.id, city_id: @city.id)
    end

    it 'return cities' do
      graphql_request %|
        query{
          user(id: "#{@user.id}") {
            id,
            nickname,
            image,
            visit,
            visited,
            favorite {
              id,
              city,
              visited,
              position{
                lng,
                lat
              }
            }
          }
      }|
      
      expect(response).to have_http_status(:ok)
    end
  end
end  