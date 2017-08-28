ServiceInterface = GraphQL::ObjectType.define do
  name "Service"

  field :price, types.Float, hash_key: :price 
  field :url, types.String, hash_key: :url
end