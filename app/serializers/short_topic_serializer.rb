class ShortTopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user_image 
  
  def user_image
    object.user ? object.user.image : '/fallback/user_default.jpg'
  end
end