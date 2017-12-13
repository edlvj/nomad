TravelerInterface = GraphQL::ObjectType.define do
  name "TravelerInterface"
 
  field :couchsurf do
    type CouchsurfInterface
    resolve -> (obj, args, ctx) {
      CouchsurfService.new(obj.title_eng).parse(obj.lat, obj.long)
    }
  end
  
  field :country, types.String do
    resolve -> (obj, args, ctx) {
      obj.country.title
    }
  end 
  
  field :region, types.String do
    resolve -> (obj, args, ctx) {
      obj.country.region.title
    }
  end 

end