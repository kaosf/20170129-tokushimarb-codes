require './https_util'
require './parse'

def log
  log = []
  3.times do
    body = https_get 'https://google.com/'
    value = parse_body_and_get_value body
    log << value
  end
  log
end
