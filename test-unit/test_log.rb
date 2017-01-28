require 'test-unit'
require 'test/unit/rr'
require './log'

class TestLog < Test::Unit::TestCase
  def html n
    body = <<EOS
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>302 Moved</TITLE></HEAD><BODY>
<H1>302 Moved</H1>
The document has moved
<A HREF="https://www.google.co.jp/?gfe_rd=cr&amp;ei=XX-xxxxxxxxxxxxxxxxxx#{n}">here</A>.
</BODY></HTML>
EOS
  end

  def response_body
    @n ||= 0
    @n += 1
    html @n
  end

  setup do
    stub(self).https_get { response_body }
  end

  test 'log' do
    assert_equal(
      [
        'XX-xxxxxxxxxxxxxxxxxx1',
        'XX-xxxxxxxxxxxxxxxxxx2',
        'XX-xxxxxxxxxxxxxxxxxx3',
      ], log)
  end
end
