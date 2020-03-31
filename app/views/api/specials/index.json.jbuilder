json.array! @specials.each do |special|
  json.id special.id
  json.name special.name
  json.price special.price
  json.special_type_id special.special_type_id
  json.location_id special.location_id
  json.day special.day
  json.start_time special.start_time
  json.end_time special.end_time
end