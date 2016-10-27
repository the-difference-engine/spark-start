Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV["clientid"],
    ENV["clientsecret"],
    ENV["domain"],
    callback_path: "/auth/auth0/callback"
  )
end
