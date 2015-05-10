module Documentation
  class Combiner
    def initialize(formatter:, trimmer:, raw_data:)
      @formatter = formatter
      @trimmer = trimmer
      @raw_data = raw_data
    end

    def run
      @formatter.run(introduction_content, trimmed_rspec_content)
    end

    private

    def introduction_content
      @raw_data.introduction_content
    end

    def trimmed_rspec_content
      @trimmer.run(@raw_data.generated_rspec_content)
    end
  end
end
