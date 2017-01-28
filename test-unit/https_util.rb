require 'net/https'
require 'uri'

def https_get uri_string
  uri = URI.parse uri_string
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Get.new(uri.path)
  res = https.request(req)
  res.body
end
