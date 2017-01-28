require './log'

describe 'log' do
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

  before do
    allow(self).to receive(:https_get).and_return(html(1), html(2), html(3))
  end

  it do
    expect(log).to eq([
        'XX-xxxxxxxxxxxxxxxxxx1',
        'XX-xxxxxxxxxxxxxxxxxx2',
        'XX-xxxxxxxxxxxxxxxxxx3',
      ])
  end
end
