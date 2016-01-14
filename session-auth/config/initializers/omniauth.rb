Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, '2F0142E9C483D6620A061D47814BEBDA'
end