CitiesInterface = GraphQL::ObjectType.define do
  name "cities"
  description "A cities"

  field :id, types.ID
  field :title, types.String
  field :image, types.String
end
  