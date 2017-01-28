require './parse'

describe 'parse' do
  subject { parse_body_and_get_value(body) }

  context "valid HTML" do
    let(:body) do
      <<'EOS'
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>302 Moved</TITLE></HEAD><BODY>
<H1>302 Moved</H1>
The document has moved
<A HREF="https://www.google.co.jp/?gfe_rd=cr&amp;ei=XX-xxxxxxxxxxxxxxxxxxx">here</A>.
</BODY></HTML>
EOS
    end

    it { is_expected.to eq 'XX-xxxxxxxxxxxxxxxxxxx' }
  end

  context "invalid HTML" do
    let(:body) { '' }
    it { is_expected.to be_nil }
  end
end
