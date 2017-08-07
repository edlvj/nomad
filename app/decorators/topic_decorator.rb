class TopicDecorator < Drape::Decorator
  delegate_all

  def user_image
    object.user ? object.user.image : '/fallback/user_default.jpg'
  end
  
  def user
    object.user ? object.user.nickname : 'No name'
  end
  
  def created
    object.created_at.to_s("%B %d, %Y")  
  end
end