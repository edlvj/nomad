class CommentDecorator < Drape::Decorator
  delegate_all
  
  def user_image
    object.user ? object.user.image : '/fallback/user_default.jpg'
  end
  
  def created_at
    object.created_at.to_s("%B %d, %Y") 
  end
end