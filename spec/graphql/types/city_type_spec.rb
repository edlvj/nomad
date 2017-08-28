RSpec.describe 'CityType', type: :request do
 
  describe 'Index and Show' do
    before do
      @city = create :city, :with_country 
      
      @fun_rating = create :rating, city_id: @city.id, rate_type: "fun" 
      @quality_life_rating = create :rating, city_id: @city.id, rate_type: "quality_life" 
      @safe_rating =  create :rating, city_id: @city.id, rate_type: "safe" 
      @toward_rating = create :rating, city_id: @city.id, rate_type: "toward" 
      
      @topic = create :topic, city_id: @city_id
    end 

    it 'return cities' do
      graphql_request %|
      query {
        cities { 
          id, 
          title,
          image
        }
      }|
      
      expect(response).to have_http_status(:ok)
    end
    
    it 'return city' do
      graphql_request %|
        query {
          city(id: "#{@city.id}") {
            id,
            title_eng,
            title,
            image,
            ratings{
              fun_avg,
              quality_life_avg,
              safe_avg,
              toward_avg
            },
            topics{
              id,
              title,
              text,
              user_image
            }
          }
        }|
      expect(response).to have_http_status(:ok)
    end
  end
  
end  