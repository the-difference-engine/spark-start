Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Auth0.clientid = ENV["clientid"],
    Auth0.clientsecret = ENV["clientsecret"],
    Auth0.domain = ENV["domain"],
    callback_path: "/auth/auth0/callback"
  )
end
