require_relative "../html"

describe HtmlBuilder do
  include HtmlBuilder

  it "generates an html tag" do
    expect(html).to eq("<html></html>")
  end

  it "generates an html tag with attributes" do
    expect(html(lang: "en")).to eq(%{<html lang="en"></html>})
  end

  it "generates an html tag with attributes and children" do
    expect(html(lang: "en") { body }).to eq(%{<html lang="en"><body></body></html>})
  end

  # known issue
  it "generates deeply nested html, but only trailing tags win" do
    expect(html {
      body {
        table {
          tr {
            td { "New Jersey" }
            td { "Trenton" }
          }
          tr {
            td { "New York" }
            td { "Albany" }
          }
        }
      }
    }).to eq(%{<html><body><table><tr><td>New Jersey</td><td>Trenton</td></tr><tr><td>New York</td><td>Albany</td></tr></table></body></html>})
  end
end
