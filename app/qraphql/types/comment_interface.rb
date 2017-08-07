CommentInterface = GraphQL::ObjectType.define do
  name "Comment"

  field :id, types.ID
  field :text, types.String
  field :user_id, types.Int
  field :user_image, types.String
  field :created_at, types.String
end