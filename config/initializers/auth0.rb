Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    '120SH91pK3Jo2SIUNxPW3PU688IcVu83',
    'FCMobloXpFRp3AsDp4cqPEXagOHnK9qpUmnHJydskaVbUHUvhBbGqs_9DgMY3dUe',
    'sparkstart.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
