json.array! @locations.each do |location|
  json.id location.id
  json.name location.name
  json.description location.description
  json.capacity location.capacity
  json.address location.address
  json.headcount location.headcount
end