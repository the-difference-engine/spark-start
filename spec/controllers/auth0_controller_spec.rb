require 'rails_helper'

RSpec.describe Auth0Controller, type: :controller do

  before(:each) do
    OmniAuth.config.mock_auth[:spark_start] = 
    OmniAuth::AuthHash.new({"provider"=>"auth0",
     "uid"=>"auth0|57b2624b2de91ce71867bd58",
     "info"=>
      {"name"=>"justinviegelahn@gmail.com",
       "email"=>"justinviegelahn@gmail.com",
       "nickname"=>"justinviegelahn",
       "first_name"=>nil,
       "last_name"=>nil,
       "location"=>nil,
       "image"=>"https://s.gravatar.com/avatar/94468abac7d8e9793997486cf043d347?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fju.png"},
     "credentials"=>
      {"token"=>"iRiWi67DNYWMGccw",
       "expires"=>true,
       "id_token"=>
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6Imp1c3RpbnZpZWdlbGFobkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImlzcyI6Imh0dHBzOi8vc3BhcmtzdGFydC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NTdiMjYyNGIyZGU5MWNlNzE4NjdiZDU4IiwiYXVkIjoiMTIwU0g5MXBLM0pvMlNJVU54UFczUFU2ODhJY1Z1ODMiLCJleHAiOjE0NzIyMTE1MjYsImlhdCI6MTQ3MjE3NTUyNn0.w8fj2h77-9C8UN8ZhH280IPJS56OdRX9iFcLAtvgcIo",
       "token_type"=>"Bearer"},
     "extra"=>
      {"raw_info"=>
        {"email"=>"justinviegelahn@gmail.com",
         "email_verified"=>false,
         "clientID"=>"120SH91pK3Jo2SIUNxPW3PU688IcVu83",
         "updated_at"=>"2016-08-26T01:38:45.743Z",
         "picture"=>"https://s.gravatar.com/avatar/94468abac7d8e9793997486cf043d347?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fju.png",
         "user_id"=>"auth0|57b2624b2de91ce71867bd58",
         "name"=>"justinviegelahn@gmail.com",
         "nickname"=>"justinviegelahn",
         "identities"=>[{"user_id"=>"57b2624b2de91ce71867bd58", "provider"=>"auth0", "connection"=>"Username-Password-Authentication", "isSocial"=>false}],
         "created_at"=>"2016-08-16T00:46:03.319Z",
         "sub"=>"auth0|57b2624b2de91ce71867bd58"}}}
      )
    OmniAuth.config.test_mode = true
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:spark_start]
  end

  describe 'GET auth0#callback' do
    it "creates new user" do
      get :callback, params: OmniAuth.config.mock_auth[:spark_start]
      user = User.last
      expect(user.email).to eq("justinviegelahn@gmail.com") 
    end
  end
  describe 'GET auth0#callback' do
    before(:each) do
      @user = create(:user)
    end
    it "redirects to root path" do
      get :callback, params: OmniAuth.config.mock_auth[:spark_start]
      expect(response).to redirect_to(root_path)
    end
  end

  # def auth0_payload
  #   OmniAuth.config.mock_auth[:spark_start] = 
  #   OmniAuth::AuthHash.new({"provider"=>"auth0",
  #    "uid"=>"auth0|57b2624b2de91ce71867bd58",
  #    "info"=>
  #     {"name"=>"justinviegelahn@gmail.com",
  #      "email"=>"justinviegelahn@gmail.com",
  #      "nickname"=>"justinviegelahn",
  #      "first_name"=>nil,
  #      "last_name"=>nil,
  #      "location"=>nil,
  #      "image"=>"https://s.gravatar.com/avatar/94468abac7d8e9793997486cf043d347?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fju.png"},
  #    "credentials"=>
  #     {"token"=>"iRiWi67DNYWMGccw",
  #      "expires"=>true,
  #      "id_token"=>
  #       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6Imp1c3RpbnZpZWdlbGFobkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImlzcyI6Imh0dHBzOi8vc3BhcmtzdGFydC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NTdiMjYyNGIyZGU5MWNlNzE4NjdiZDU4IiwiYXVkIjoiMTIwU0g5MXBLM0pvMlNJVU54UFczUFU2ODhJY1Z1ODMiLCJleHAiOjE0NzIyMTE1MjYsImlhdCI6MTQ3MjE3NTUyNn0.w8fj2h77-9C8UN8ZhH280IPJS56OdRX9iFcLAtvgcIo",
  #      "token_type"=>"Bearer"},
  #    "extra"=>
  #     {"raw_info"=>
  #       {"email"=>"justinviegelahn@gmail.com",
  #        "email_verified"=>false,
  #        "clientID"=>"120SH91pK3Jo2SIUNxPW3PU688IcVu83",
  #        "updated_at"=>"2016-08-26T01:38:45.743Z",
  #        "picture"=>"https://s.gravatar.com/avatar/94468abac7d8e9793997486cf043d347?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fju.png",
  #        "user_id"=>"auth0|57b2624b2de91ce71867bd58",
  #        "name"=>"justinviegelahn@gmail.com",
  #        "nickname"=>"justinviegelahn",
  #        "identities"=>[{"user_id"=>"57b2624b2de91ce71867bd58", "provider"=>"auth0", "connection"=>"Username-Password-Authentication", "isSocial"=>false}],
  #        "created_at"=>"2016-08-16T00:46:03.319Z",
  #        "sub"=>"auth0|57b2624b2de91ce71867bd58"}}}
  #     )
  # end
end
