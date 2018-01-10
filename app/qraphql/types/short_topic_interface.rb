ShortTopicInterface = GraphQL::ObjectType.define do
  name "Short"
  
  field :id, types.ID
  field :title, types.String
  field :text, types.String
  field :user_image, types.String
end