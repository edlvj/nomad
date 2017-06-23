feature 'show city', type: :feature, js: true do
 
  background do
    @city = create :city, :with_country
    visit "/:8080/city/#{ @city.id }"
    sleep 2
  end
  
  scenario 'user can see title' do
    expect(page).to have_content(@city.title)
  end
end  