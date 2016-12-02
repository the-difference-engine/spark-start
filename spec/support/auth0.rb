module Auth0
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:auth0] = {
      'provider' => 'auth0',
      'userinfo' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url',
        'extra' => {
          'raw_info' => {
            'email' => 'justinviegelahn@gmail.com',
            'identities' => [{
                               "user_id" => 'abc123'
                             }]
          }
        }
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    }
  end
end
