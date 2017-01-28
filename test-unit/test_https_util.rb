require 'test-unit'
require 'test/unit/rr'
require './https_util'

class TestHttpsUtil < Test::Unit::TestCase
  test "receive URI string and return the response body" do
    uri = 'https://example.com/a/b/c'

    https = Struct.new(:use_ssl).new
    mock(Net::HTTP).new('example.com', 443) { https }
    mock(https).use_ssl=(true)
    req = Object.new
    mock(Net::HTTP::Get).new('/a/b/c') { req }
    res = Struct.new(:body).new('response-body')
    mock(https).request(req) { res }

    actual_response_body = https_get uri
    assert_equal 'response-body', actual_response_body
  end
end
