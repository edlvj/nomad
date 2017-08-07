module GraphqlRequest
  def graphql_request(data, headers: nil)
    post '/graphql', params: "query= #{data}", headers: headers
  end
  
end