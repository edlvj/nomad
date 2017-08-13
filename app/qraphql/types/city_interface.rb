CityInterface = GraphQL::ObjectType.define do
  name "City"
  description "A city"  
    
  field :id, types.ID
  field :title, types.String
  field :title_eng, types.String
  field :image, types.String

  field :rating, RatingInterface do 
    resolve -> (obj, args, ctx) {
      obj.rating.decorate
    }
  end
  
  field :topics do 
    type types[ShortTopicInterface]
    resolve -> (obj, args, ctx) {
      obj.topics.decorate if obj.topics
    }
  end
end