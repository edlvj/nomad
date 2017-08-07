class UserDecorator < Drape::Decorator
  delegate_all
  
  def visited
    object.favorite ? object.favorite.where(visited: true).count : 0
  end
  
  def visit
    object.favorite ? object.favorite.where(visited: false).count : 0
  end
end  