require 'colorize'

module Documentation
  class Formatter
    def run(introduction_content, rspec_content)
      "#{introduction_content}#{rspec_heading}#{rspec_content.uncolorize}"
    end

    private

    def rspec_heading
      "\n\n\n*** Features and Unit Specs ***\n\n"
    end
  end
end
