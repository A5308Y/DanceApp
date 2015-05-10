module Documentation
  class RawData
    def initialize(io:, config:)
      @io = io
      @config = config
    end

    def introduction_content
      introduction_file.read
    end

    def generated_rspec_content
      rspec_file.read
    end

    private

    def introduction_path
      @config.introduction_path
    end

    def generated_rspec_path
      @config.generated_rspec_path
    end

    def rspec_file
      @io.open generated_rspec_path
    end

    def introduction_file
      @io.open introduction_path
    end
  end
end
