require './https_util'
# empty line to compare to test-unit style
# empty line to compare to test-unit style

describe 'receive URI string and return the response body' do
  it do
    uri = 'https://example.com/a/b/c'

    https = Struct.new(:use_ssl).new
    expect(Net::HTTP).to receive(:new).with('example.com', 443).and_return(https)
    expect(https).to receive(:use_ssl=).with(true)
    req = Object.new
    expect(Net::HTTP::Get).to receive(:new).with('/a/b/c').and_return(req)
    res = Struct.new(:body).new('response-body')
    expect(https).to receive(:request).with(req).and_return(res)

    actual_response_body = https_get uri
    expect(actual_response_body).to eq 'response-body'
  end
end
