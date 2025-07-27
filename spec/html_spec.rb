require_relative "../html"

describe HtmlBuilder do
  # This seems kind of suspicious
  include HtmlBuilder
  
  it "generates an html tag" do
    expect(html).to eq("<html></html>")
  end

  it "generates an html tag with attributes" do
    expect(html(lang: "en")).to eq(%{<html lang="en"></html>})
  end
end