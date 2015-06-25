module PathRewrite
  class Configuration

    def check_redirect=(value)
      @check_redirect = value
    end

    def check_redirect?(request=nil)
      return @check_redirect unless @check_redirect.respond_to?(:call)

      if @check_redirect.arity == 0
        @check_redirect.call
      else
        @check_redirect.call request
      end
    end

  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end

# initialize configuration
PathRewrite.configuration.check_redirect = true
