TravelerInterface = GraphQL::ObjectType.define do
  name "Traveler Interface"
 
  field :couchsurf do
    type CouchsurfInterface
    resolve -> (obj, args, ctx) {
      obj[:couchsurf]
    }
  end
 
  field :country, types.String, hash_key: :country
  field :region, types.String, hash_key: :region
end