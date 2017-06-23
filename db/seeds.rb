CITIES_AMOUNT_IN_COUNTRY = 10

#User.find_or_create_by! email: 'admin@bezviz.com',
 #           password: '111111',
 #           admin: true

['Europe', 'America', 'Asia'].each do |t|
  Region.find_or_create_by! title: t
end

Region.find_each do |region|
  Country.find_or_create_by! title: FFaker::AddressUA.country,
                             title_eng: FFaker::Address.country,
                             region_id: region.id
end

Country.find_each do |country|
  FinRequirement.find_or_create_by! country_id: country.id,
                                    cost: '23'
  
  CITIES_AMOUNT_IN_COUNTRY.times do
    City.find_or_create_by! title: FFaker::AddressUA.city,
                            title_eng: FFaker::Address.city,
                            country_id: country.id
  end                         
end

City.find_each do |city|
  Rating.find_or_create_by! city_id:city.id
end