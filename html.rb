module HtmlBuilder
  def self.included(base)
    tag = ->(name) do
      base.define_method(name) do |**attrs, &block|
        "<#{name}></#{name}>"
      end
    end

    tag.(:html)
  end
end