class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :user_image, :created_at
  
  def user_image
    object.user.image
  end
  
  def created_at
    object.created_at.to_s("%B %d, %Y") 
  end
end