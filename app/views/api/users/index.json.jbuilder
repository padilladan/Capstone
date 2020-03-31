json.array! @users.each do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.location_id user.location_id
end