require "pry"
RSpec.describe 'TravelerType', type: :request do

  describe 'Show' do
    before do 
      @city = create :city, :with_country
      @user = create :user
    end

    it 'return price' do
      graphql_request %|
        query {
          city_traveler(id: "#{@city.id}") {
            couchsurf {
                hosts,
                url
              },  
            country,
            region
          }
        }|
        
      binding.pry    
      expect(response).to have_http_status(:ok)
    end
  end
end  