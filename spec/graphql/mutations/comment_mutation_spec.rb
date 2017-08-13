requireT 'pry'
RSpec.describe 'CommentMutation', type: :request do
  subject { create :topic }
  let(:user) { create :user}
  let(:auth_headers) { user.create_new_auth_token }
 
  describe 'Create' do

    it 'save comment' do
      graphql_request %|
        mutation {
          addComment(input: {topic_id: "#{subject.id}", text: "Life is short" }) {
            comment{
              id
            }
          }
        }|, headers: auth_headers
        
      expect(response).to have_http_status(:ok)
    end
  end

end  