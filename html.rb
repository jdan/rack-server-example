class HtmlBuilder
  def html(**attrs, &block)
    context = HtmlContext.new
    context.build_tag(:html, **attrs, &block)
    context.source
  end

  class HtmlContext
    attr_reader :source

    def initialize
      @source = ""
    end

    def build_tag(name, **attrs, &block)
      @source << "<#{name}"

      if attrs.empty?
        @source << ">"
      else
        @source << " "
        @source << attrs.map { |k, v| %{#{k}="#{v}"} }.join(" ")
        @source << ">"
      end

      if block
        result = instance_eval(&block)

        # Text nodes are represented as
        #
        #   p { "Hello, world!" }
        #
        # So we inspect the type of the block evaluation,
        # and append to @source if we need to.
        if result.is_a? String
          @source << result
        end
      end

      @source << "</#{name}>"

      :ok
    end

    def method_missing(name, **attrs, &block)
      build_tag(name, **attrs, &block)
    end

    def respond_to_missing?(name, include_private = false)
      true
    end
  end
end
