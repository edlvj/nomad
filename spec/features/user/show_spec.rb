feature 'show user', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @cities = create :city, :with_country
    #api_v1_user_url(user.id)
    visit "/:8080/user/#{ user.id }"
    sleep 2
  end
  
  scenario 'user can see name' do
  end
end 