class User < ActiveRecord::Base
  has_many :comments
  has_many :article_users
  has_many :articles, through: :article_users

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.name     = data.info.name
    user.provider = data.provider
    user.uid      = data.uid
    user.picture  = data.info.image
    user.token    = data.credentials.token
    user.link     = data.extra.raw_info.link
    user.save

    user
  end

  def client
    @client = Facebook.client(access_token: token) || Twitter.client(access_token: token)
  end
end
