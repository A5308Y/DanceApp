require 'lib_helper'
require 'documentation/combiner'

describe Documentation::Combiner do
  describe '#run' do
    let(:trimmer) { double(:trimmer) }
    let(:formatter) { double(:formatter) }
    let(:raw_data) do
      double(:raw_data, introduction_content: 'INTRO', generated_rspec_content: 'RSPEC')
    end

    subject(:result) do
      Documentation::Combiner.new(formatter: formatter, trimmer: trimmer, raw_data: raw_data)
    end

    it 'hands the contents of the introcution_file and the trimmed rspec_file to the formatter' do
      expect(trimmer).to receive(:run).with('RSPEC').and_return 'RSPE'
      expect(formatter).to receive(:run).with('INTRO', 'RSPE').and_return 'formatted_result'

      expect(subject.run).to eq 'formatted_result'
    end
  end
end
