require 'pry'
RSpec.describe 'TopicMutation', type: :request do
  subject { create :city, :with_country }
  let(:user) { create :user}
  let(:auth_headers) { user.create_new_auth_token }
  let(:variables) { { city_id: "#{subject.id}", title: "topic", text: "text topic" }  }
 
  describe 'Create' do

    it 'save topic' do
      graphql_request %|
        mutation addTopic($city_id: ID, $title: String, $text: String) {
          AddTopic(input: {city_id: $city_id, title: $title, text: $text }) {
            topic{
              id
            }
          }
        }|, headers: auth_headers, variables: variables
        
        
        
      binding.pry  
      expect(response).to have_http_status(:ok)
    end
  end

end  