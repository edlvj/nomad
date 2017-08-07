class CommentDecorator < Drape::Decorator
  delegate_all
  
  def user_image
    object.user.image
  end
  
  def created_at
    object.created_at.to_s("%B %d, %Y") 
  end
end