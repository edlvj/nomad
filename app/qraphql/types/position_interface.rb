PositionInterface = GraphQL::ObjectType.define do
  name "Position"

  field :lat, types.Float, hash_key: :lat
  field :lng, types.Float, hash_key: :lng
end