json.array! @users do |user|
  json.id user.id
  json.admin user.admin
  json.email user.email
  json.profile_id user.profile.id
end