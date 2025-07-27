require_relative "../hello_world"

describe HelloWorld do
  it "renders /" do
    expect(HelloWorld.new.call({'REQUEST_PATH' => '/'})).to eq([
      200,
      {'content-type' => 'text/html'},
      ["<html><body><h2>Hello World!</h2></body></html>"]
    ])
  end

  it "renders 404 pages" do
    expect(HelloWorld.new.call({'REQUEST_PATH' => '/404'})).to eq([
      404,
      {'content-type' => 'text/html', "content-length" => "48"},
      ["<html><body><h4>404 Not Found</h4></body></html>"]
    ])
  end

  it "renders /advice" do
    res = HelloWorld.new.call({'REQUEST_PATH' => '/advice'})

    # test status code and response headers
    expect(res[0..1]).to eq([200, {'content-type' => 'text/html'}])

    # test the html response
    expect(res[2][0]).to start_with("<html><body><b><em>")
    expect(res[2][0]).to end_with("</em></b></body></html>")
  end
end
