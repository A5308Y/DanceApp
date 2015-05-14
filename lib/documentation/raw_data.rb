module Documentation
  class RawData
    def initialize(io:, config:)
      @io = io
      @config = config
    end

    def introduction_content
      introduction_file.read
    end

    def feature_content
      feature_documentation_file.read
    end

    def developer_content
      unit_documentation_file.read
    end

    private

    def introduction_path
      @config.introduction_path
    end

    def introduction_file
      @io.open introduction_path
    end

    def feature_documentation_path
      @config.feature_documentation_path
    end

    def feature_documentation_file
      @io.open feature_documentation_path
    end

    def unit_documentation_path
      @config.unit_documentation_path
    end

    def unit_documentation_file
      @io.open unit_documentation_path
    end
  end
end
