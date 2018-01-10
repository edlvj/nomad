FavoriteInterface = GraphQL::ObjectType.define do
 name "Favorite"

  field :id, types.ID
  field :city, types.String
  field :visited, types.Boolean

  field :position do
    type PositionInterface
    resolve -> (obj, args, ctx) {
      obj.position
    }
  end
end