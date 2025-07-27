module HtmlBuilder
  def self.included(base)
    tag = ->(name) do
      base.define_method(name) do |**attrs, &block|
        attr_string = attrs.map { |k, v| %{#{k}="#{v}"} }.join " "
        attr_string = " #{attr_string}" unless attr_string.empty?

        children_html = block ? block.() : ""

        "<#{name}#{attr_string}>#{children_html}</#{name}>"
      end
    end

    tag.(:html)
    tag.(:body)
  end
end