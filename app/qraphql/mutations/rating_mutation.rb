module RatingMutation
  Create = GraphQL::Relay::Mutation.define do
    name "AddRating"
    
    input_field :city_id, types.ID
    input_field :rate, types.Int
    input_field :rate_type, types.String
    
    return_field :rating, RatingInterface
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {

      rating = Rating.new(city_id: inputs[:city_id], rate: inputs[:rate], rate_type: inputs[:rate_type])

      if rating.save
        { rating: rating }
      else
        { errors: rating.errors.to_a }
      end
    }
  end
end