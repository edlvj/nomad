class RatingDecorator < Drape::Decorator
  delegate_all

  Rating::RATING_TYPES.each do |type|
    define_method("#{type}_avg") do 
      Rating.where(rate_type: type, city_id: object.city.id ).average(:rate).to_i
    end
  end 
  
end