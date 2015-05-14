require 'colorize'
require 'erb'

module Documentation
  class Formatter
    def run(introduction_content, feature_content, developer_content)
      template = File.read('lib/documentation/formatted_content.txt.erb')
      ERB.new(template).result(binding).uncolorize
    end
  end
end
