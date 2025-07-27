module HtmlBuilder
  def self.included(base)
    # I should probably parse the W3C spec or something
    tags = [
      # top level tags
      :html, :head, :body,

      # head tags
      :title, :meta,

      # layout tags
      :div, :span,

      # prose tags
      :h1, :h2, :h3, :h4, :h5, :h6,
      :p, :a, :strong, :em,

      # table tags
      :table, :thead, :tbody, :th, :tr, :td,
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
