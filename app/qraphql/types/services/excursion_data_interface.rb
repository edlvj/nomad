ExcursionDataInterface = GraphQL::ObjectType.define do
  name "Excursion Data Interface"
  
  field :price, types.String, hash_key: :price
  field :title, types.String, hash_key: :title
  field :url, types.String, hash_key: :url
end