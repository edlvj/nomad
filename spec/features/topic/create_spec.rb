feature 'create topic', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @cities = create :city, :with_country
    visit '/:8080/topic/new'
    sleep 2
  end
  
  scenario 'user can see form' do
  end
  
  scenario 'user can see suceess message' do
  end 
end  