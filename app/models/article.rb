class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :article_users
  has_many :users, through: :article_users, dependent: :destroy
end
