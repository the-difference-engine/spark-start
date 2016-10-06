json.array! @tags.each do |tag|
  json.tag_name tag.tag_name
end