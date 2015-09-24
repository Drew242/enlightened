# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'wikipedia'

page = Wikipedia.find('fun')

puts page.title

# class WikipediaService
#   include HTTParty
#   base_uri = "en.wikipedia.org/w/api.php"
#
#   def self.request
#
#   end
#
# end
