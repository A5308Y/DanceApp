module Documentation
  class Combiner
    def initialize(formatter:, trimmer:, raw_data:)
      @formatter = formatter
      @trimmer = trimmer
      @raw_data = raw_data
    end

    def run
      @formatter.run(introduction_content, trimmed_feature_content, trimmed_developer_content)
    end

    private

    def introduction_content
      @raw_data.introduction_content
    end

    def trimmed_feature_content
      @trimmer.run(@raw_data.feature_content)
    end

    def trimmed_developer_content
      @trimmer.run(@raw_data.developer_content)
    end
  end
end
