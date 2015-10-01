require 'capybara/rspec'
require 'vcr'
require 'webmock'
require 'simplecov'

RSpec.configure do |config|
  SimpleCov.start 'rails'
  WebMock.allow_net_connect!
  config.include Capybara::DSL

  def user
    @user ||= User.new(name: "Drew",
                       picture: "something.jpg",
                       token: ENV['user_tokenT'],
                       uid: "1111",
                       provider: "twitter")
  end

  def login_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new ({
      'provider'    => user.provider,
      'uid'         => user.uid,
      'info'        => {:name =>user.name,
                        :picture =>user.picture},
      'credentials' => {:token => ENV['USER_TOKEN']},
      'extra'       => {'raw_info' => {'link' => 'test'}}
    })
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end
