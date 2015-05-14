require 'lib_helper'
require 'documentation/formatter'
require 'support/matchers/include_colorizing_strings_matcher'

describe Documentation::Formatter do
  let(:feature_content) { 'It allows to change my preferences.' }
  let(:developer_content) { "should not include Randomized\nshould not end with characters" }
  let(:introduction_content) { "To set up this app make sure to:\n1. install postgresql" }

  subject(:formatted_documentation) do
    Documentation::Formatter.new.run(introduction_content, feature_content, developer_content)
  end

  describe 'the result of #run' do
    it { is_expected.to start_with(introduction_content) }
    it { is_expected.to include("\n*** Features ***\n") }
    it { is_expected.to include("\n*** Developer Documentation ***\n") }
    it { is_expected.to end_with(developer_content + "\n") }
  end

  context 'with colorizing strings given' do
    let(:developer_content) { "[32m      should not have lines starting with \"Finished in\"[0m" }
    it { is_expected.not_to include_colorizing_strings }
  end
end
