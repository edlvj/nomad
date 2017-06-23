feature 'Index cities', type: :feature, js: true do
  let(:user) { create :user }

  background do
    @cities = create_list(:city, 13, :with_country)
    visit '/:8080'
    sleep 2
  end
  
  scenario 'user can see title' do
    expect(page).to have_content("Nomad")
  end
  
  scenario 'user can see city title' do
   # expect(page).to have_content(@cities.first.title)
  end 

  scenario 'user not logged see in nav' do
    expect(page).to have_content("Увійти через Facebook")
    expect(page).to have_no_content("Вихід")
  end 

  scenario 'logged user see in nav' do
   # expect(page).to have_no_content("Увійти через Facebook")
   # expect(page).to have_content("Профіль")
  end 
end  