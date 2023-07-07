json.client do
  json.id @client.id
  json.firstname @client.firstname
  json.lastname @client.lastname
  json.direction @client.direction
  json.email @client.email
end
