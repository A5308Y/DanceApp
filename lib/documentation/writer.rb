module Documentation
  class Writer
    def initialize(io:, result:, config:)
      @io = io
      @result = result
      @config = config
    end

    def save
      @io.open(@config.documentation_output_path, 'w').write @result
    end
  end
end
