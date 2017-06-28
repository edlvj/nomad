class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :city, :visited, :position
  
  def city
    object.city.title  
  end  
  
  def position
    { lat: object.city.lat.to_f, lng: object.city.long.to_f }
  end 
end