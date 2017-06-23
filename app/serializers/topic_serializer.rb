class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user, :created
  has_many :comments
  
  def user
    object.user ? object.user.nickname : 'No name'
  end   
  
  def created
    object.created_at.to_s("%B %d, %Y")  
  end
end