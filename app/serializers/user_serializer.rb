class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :image, :visit, :visited
  has_many :favorite, serializer: FavoriteSerializer 
  
  def visited
    object.favorite ? object.favorite.where(visited: true).count : 0
  end
  
  def visit
    object.favorite ? object.favorite.where(visited: false).count : 0
  end
end