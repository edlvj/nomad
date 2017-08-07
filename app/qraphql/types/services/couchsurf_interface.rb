CouchsurfInterface = GraphQL::ObjectType.define do
  name "Couchsurf"

  field :hosts, types.Float, hash_key: :hosts
  field :url, types.String, hash_key: :url
end