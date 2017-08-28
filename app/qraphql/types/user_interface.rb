UserInterface = GraphQL::ObjectType.define do
  name "user"

  field :id, types.ID
  field :nickname, types.String
  field :image, types.String
  field :visit, types.Int
  field :visited, types.Int

  field :favorite do 
    type types[FavoriteInterface]
    resolve -> (obj, args, ctx) {
      obj.favorite.decorate
    }
  end

end