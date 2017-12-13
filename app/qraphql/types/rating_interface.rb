RatingInterface = GraphQL::ObjectType.define do
  name "rating"
  field :id, types.ID
  
  field :fun_avg, types.Float
  field :quality_life_avg, types.Float
  field :safe_avg, types.Float
  field :toward_avg, types.Float
end