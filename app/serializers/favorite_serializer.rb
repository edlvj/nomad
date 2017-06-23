class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :city, :visited
  
  def city
    object.city.title  
  end      
end