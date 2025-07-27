module HtmlBuilder
  def tag(name, *attrs, &block)
    "<#{name}></#{name}>"
  end

  def html = tag("html")
end