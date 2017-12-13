PositionInterface = GraphQL::ObjectType.define do
  name "position"

  field :lat, types.Float, hash_key: :lat
  field :lng, types.Float, hash_key: :lng
end