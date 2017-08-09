CityInterface = GraphQL::ObjectType.define do
  name "City"
  description "A city"  
    
  field :id, types.ID
  field :title, types.String
  field :title_eng, types.String
  field :image, types.String
  
  field :price, PriceInterface do 
    resolve -> (obj, args, ctx) {
      obj.decorate.price
    }
  end
  
  field :traveler, TravelerInterface do 
    resolve -> (obj, args, ctx) {
      obj.decorate.traveler
    }
  end
  
  field :ratings, RatingInterface do 
    resolve -> (obj, args, ctx) {
      obj.rating.decorate if obj.rating
    }
  end
  
  field :excursions, ExcursionInterface do 
    resolve -> (obj, args, ctx) {
      obj.decorate.excursions
    }
  end
  
  field :topics do 
    type types[ShortTopicInterface]
    resolve -> (obj, args, ctx) {
      obj.topics.decorate if obj.topics
    }
  end
end