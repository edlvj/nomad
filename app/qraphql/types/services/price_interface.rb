PriceInterface = GraphQL::ObjectType.define do
  name "Price Interface"
  
  field :airbnb do
    type ServiceInterface
    resolve -> (obj, args, ctx) {
      obj[:airbnb]
    }
  end
  
  field :meal do
    type ServiceInterface
    resolve -> (obj, args, ctx) {
      obj[:meal]
    }
  end
  
  field :fin_req, types.String, hash_key: :fin_req 
end
