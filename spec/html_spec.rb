require_relative "../html"

describe HtmlBuilder do
  # This seems kind of suspicious
  include HtmlBuilder
  
  it "generates an html tag" do
    expect(html).to eq("<html></html>")
  end
end