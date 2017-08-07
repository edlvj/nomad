TopicInterface = GraphQL::ObjectType.define do
  name "Topic Interface"
  
  field :id, types.ID
  field :title, types.String
  field :text, types.String
  field :user, types.String
  field :created, types.String
  
  field :comments do 
    type types[CommentInterface]
    resolve -> (obj, args, ctx) {
      obj.comments.decorate
    }
  end
end