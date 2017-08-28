MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  
  field :addFavorite, field: FavoriteMutation::Create.field
  field :addComment, field: CommentMutation::Create.field
  field :addRating, field: RatingMutation::Create.field
  field :addTopic, field: TopicMutations::Create.field
end