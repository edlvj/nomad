RSpec.describe 'TopicType', type: :request do

  describe 'Show' do
    before do 
      @city = create :city, :with_country
      @user = create :user
      @topic = create(:topic, user_id: @user.id, city_id: @city.id)
      @comment = create(:comment, user_id: @user.id, topic_id: @topic.id)
    end

    it 'return cities' do
      graphql_request %|
        query {
          topic(id: "#{@topic.id}") {
            id,
            title,
            text,
            user,
            created,
            comments {
              id,
              text,
              user_id,
              user_image,
              created_at
            }
            
          }
        }|
      
      expect(response).to have_http_status(:ok)
    end
  end
end  