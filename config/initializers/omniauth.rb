Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_id'], ENV['facebook_secret'],
           image_size: 'large',
           scope: 'email',
           info_fields: 'email,first_name,last_name,name,link'
end
