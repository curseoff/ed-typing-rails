Rails.application.config.middleware.use OmniAuth::Builder do
  FACEBOOK_CONFIG = YAML.load_file(Rails.root.join("config","facebook.yml"))[Rails.env]
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret_key'],
    :scope => 'email,read_friendlists'
end