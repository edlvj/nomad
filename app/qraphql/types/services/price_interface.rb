PriceInterface = GraphQL::ObjectType.define do
  name "Price Interface"
  
  field :airbnb do
    type ServiceInterface
    resolve -> (obj, args, ctx) {
      AirbnbService.new(obj.title_eng).parse(obj.lat, obj.long)
    }
  end
  
  field :meal do
    type ServiceInterface
    resolve -> (obj, args, ctx) {
      NumeoService.new(obj.title_eng).parse
    }
  end

  field :fin_req, types.String do
    resolve -> (obj, args, ctx) {
      obj.country.fin_requirement.cost
    }
  end  
end
