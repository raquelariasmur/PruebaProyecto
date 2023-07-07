json.dish do
  json.id @dish.id
  json.name @dish.name
  json.description @dish.description
  json.price @dish.price
  json.state @dish.state
  json.photography rails_blob_url(@dish.photography)
end
