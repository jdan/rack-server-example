require_relative 'advice'
require_relative 'html'

class HelloWorld
  include HtmlBuilder

  def call(env)
    case env['REQUEST_PATH']
    when '/'
      [
        200,
        {'content-type' => 'text/html'},
        [
          html {
            body {
              h2 { "Hello World!"}
            }
          }
        ]
      ]
    when '/advice'
      piece_of_advice = Advice.new.generate
      [
        200,
        {'content-type' => 'text/html'},
        [
          html {
            body {
              b {
                em { piece_of_advice }
              }
            }
          }
        ]
      ]
    else
      [
        404,
        {'content-type' => 'text/html', "content-length" => "48"},
        [
          html {
            body {
              h4 { "404 Not Found" }
            }
          }
        ]
      ]
    end
  end
end
