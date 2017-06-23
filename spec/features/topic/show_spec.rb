feature 'create topic', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @cities = create :city, :with_country
    @topic = create :topic, city: city
    visit '/:8080/topic/new'
    sleep 2
  end
  
  scenario 'user can see title and text' do
  end

end 