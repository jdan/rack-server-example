module HtmlBuilder
  def self.included(base)
    tags = [
      # top level tags
      :html, :head, :body,

      # head tags
      :title, :meta,
    ]

    tags.each do |tag|
      base.define_method(tag) do |**attrs, &block|
        attr_string = attrs.map { |k, v| %{#{k}="#{v}"} }.join " "
        attr_string = " #{attr_string}" unless attr_string.empty?

        children_html = block ? block.() : ""

        "<#{tag}#{attr_string}>#{children_html}</#{tag}>"
      end
    end
  end
end
