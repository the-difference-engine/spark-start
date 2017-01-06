json.array! @users do |user|
  json.id user.id
  json.role user.role
  json.email user.email
end