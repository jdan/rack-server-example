module HtmlBuilder
  class << self
    private
    def define_tag(base, name)
      base.define_method(name) do |**attrs, &block|
        attr_string = attrs.map { |k, v| %{#{k}="#{v}"} }.join " "
        attr_string = " #{attr_string}" unless attr_string.empty?

        children_html = block ? block.() : ""

        "<#{name}#{attr_string}>#{children_html}</#{name}>"
      end
    end
  end

  def self.included(base)
    define_tag(base, :html)
    define_tag(base, :body)
  end
end