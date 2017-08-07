class FavoriteDecorator < Drape::Decorator
  delegate_all

  def city
    object.city.title
  end  
  
  def position
    { lat: object.city.lat.to_f, lng: object.city.long.to_f }
  end  
end