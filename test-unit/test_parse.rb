require 'test-unit'
require 'test/unit/rr'
require './parse'

class TestParse < Test::Unit::TestCase
  body = <<'EOS'
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>302 Moved</TITLE></HEAD><BODY>
<H1>302 Moved</H1>
The document has moved
<A HREF="https://www.google.co.jp/?gfe_rd=cr&amp;ei=XX-xxxxxxxxxxxxxxxxxxx">here</A>.
</BODY></HTML>
EOS

  test "valid HTML" do
    assert_equal 'XX-xxxxxxxxxxxxxxxxxxx', parse_body_and_get_value(body)
  end

  test "invalid HTML" do
    assert_nil parse_body_and_get_value('')
  end
end
