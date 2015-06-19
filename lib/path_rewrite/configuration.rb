module PathRewrite
  class Configuration

    def check_redirect=(value)
      @check_redirect = value
    end

    def check_redirect?
      return @check_redirect unless @check_redirect.respond_to?(:call)

      @check_redirect.call
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
