require_relative 'advice'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      [200, {'content-type' => 'text/plain'}, ['Hello World!']]
    when '/advice'
      piece_of_advice = Advice.new.generate
      [200, {'content-type' => 'text/plain'}, [piece_of_advice]]
    else
      [
        404,
        {'content-type' => 'text/plain', "content-length" => "13"},
        ["404 Not Found"]
      ]
    end
  end
end