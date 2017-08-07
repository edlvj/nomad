module TopicMutation
  Create = GraphQL::Relay::Mutation.define do
    name "AddTopic"
    
    input_field :city_id, types.String
    input_field :title, types.String
    input_field :text, types.String

    return_field :topic, TopicInterface
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      return { errors: 'Please login' } if ctx[:current_user].nil?
      
      @topic = Topic.new(user: ctx[:current_user], city_id: inputs[:city_id], title: inputs[:title], text: inputs[:text] )

      if @topic.save
        { topic: @topic }
      else
        { errors: @topic.errors.to_a }
      end
    }
  end
  
end