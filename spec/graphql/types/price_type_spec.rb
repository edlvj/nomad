RSpec.describe 'PriceType', type: :request do

  describe 'Show' do
    before do 
      @city = create :city, :with_country
      @user = create :user
    end

    it 'return price' do
      graphql_request %|
        query {
          city_price(id: "#{@city.id}") {
            airbnb{
              price,
              url
             },
             fin_req
          }
        }|
        
      expect(response).to have_http_status(:ok)
    end
  end
end  