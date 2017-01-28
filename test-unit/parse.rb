def parse_body_and_get_value body
  m = body.match('ei=([^"]*)')
  m&.[] 1
end
