QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  
  field :cities do
    type types[CitiesInterface]
    argument :search, types.String
    resolve -> (obj, args, ctx) {
      if args[:search].present?
        City.where('title LIKE ?', "%#{ args[:search] }%")
      else
        City.all
      end
    }
  end

  field :city do
    type CityInterface
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      City.find(args[:id])
    }
  end
  
  field :user do
    type UserInterface
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      User.find(args[:id]).decorate
    }
  end
  
  field :topic do
    type TopicInterface
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Topic.find(args[:id]).decorate
    }
  end
  
end