ExcursionInterface = GraphQL::ObjectType.define do
  name "ExcursionInterface"
  
  field :data do
    type types[ExcursionDataInterface]
    resolve -> (obj, args, ctx) {
      obj[:data]
    }
  end
  
  field :url, types.String, hash_key: :url
end