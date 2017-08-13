RSpec.describe 'ExcursionType', type: :request do

  describe 'Show' do
    before do 
      @city = create :city, :with_country
      @user = create :user
    end

    it 'return price' do
      graphql_request %|
        query {
          city_excursions(id: "#{@city.id}") {
            data {
              title,
              url
            },
            url
        }|
        
      expect(response).to have_http_status(:ok)
    end
  end
end  