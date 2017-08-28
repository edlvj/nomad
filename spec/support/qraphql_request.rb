module GraphqlRequest
  def graphql_request(data, headers: nil, variables: nil)
    post '/graphql', params: "query= #{data}, variables= #{ variables }", headers: headers
  end
  
end