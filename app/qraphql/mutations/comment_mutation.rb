module CommentMutation
  Create = GraphQL::Relay::Mutation.define do
    name "AddComment"
    
    input_field :topic_id, types.String
    input_field :text, types.String
    
    return_field :comment, CommentInterface
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      return { errors: 'Please login' } if ctx[:current_user].nil?
      
      comment = Comment.new(user: ctx[:current_user], topic_id: inputs[:topic_id], text: inputs[:text])

      if comment.save
        { comment: comment }
      else
        { errors: comment.errors.to_a }
      end
    }
  end
  
end