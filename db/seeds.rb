USERS_AMOUNT  = 3

User.create! email: 'admin@bezviz.com',
             password: '111111',
             admin: true

User.create! email: "#{FFaker::Internet.free_email}",
             password: '111111',
             password_confirmation: '111111'


['Европа', 'Америка', 'Азія'].each do |t|
  Region.find_or_create_by! title: t
end

Region.find_each do |region|
  Country.find_or_create_by! title: FFaker::AddressUA.country,
                             region_id: region.id
end

Country.find_each do |country|
  City.find_or_create_by! title: FFaker::AddressUA.city,
                            country_id: country.id
end