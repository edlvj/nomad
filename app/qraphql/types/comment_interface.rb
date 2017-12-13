CommentInterface = GraphQL::ObjectType.define do
  name "comment"

  field :id, types.ID
  field :text, types.String
  field :user_id, types.Int
  field :user_image, types.String
  field :created_at, types.String
end