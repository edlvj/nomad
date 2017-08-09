TravelerInterface = GraphQL::ObjectType.define do
  name "Traveler Interface"
 
  field :couchsurf do
    type CouchsurfInterface
    resolve -> (obj, args, ctx) {
      obj[:couchsurf]
    }
  end
  
  field :country, types.String do
    resolve -> (obj, args, ctx) {
      obj[:traveler][:country]
    }
  end 
  
  field :region, types.String do
    resolve -> (obj, args, ctx) {
      obj[:traveler][:region]
    }
  end 

end