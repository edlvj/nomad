RSpec.describe 'TopicMutation', type: :request do
  subject { create :city, :with_country }
  let(:user) { create :user}
  let(:auth_headers) { user.create_new_auth_token }
 
  describe 'Create' do

    it 'save topic' do
      graphql_request %|
        mutation {
          addTopic(input: {city_id: "#{subject.id}", title: "topic", text: "text topic" }) {
            topic{
              id
            }
          }
        }|, headers: auth_headers
        
      expect(response).to have_http_status(:ok)
    end
  end

end  