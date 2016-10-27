json.array! @posts.each do |post|
  json.title post.title
  json.author post.author
  json.body post.body
end