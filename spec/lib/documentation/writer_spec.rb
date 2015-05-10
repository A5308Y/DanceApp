require 'lib_helper'
require 'documentation/writer'

describe Documentation::Writer do
  describe '#write' do
    let(:output_file) { double(:output_file) }
    let(:config) { double(:config) }
    let(:io) { double(:io) }

    subject(:writer) { Documentation::Writer.new(result: 'RESULT', config: config, io: io) }

    it 'writes the formatted result to the given io stream' do
      expect(config).to receive(:documentation_output_path).and_return 'output_path'
      expect(io).to receive(:open).with('output_path', 'w').and_return output_file

      expect(output_file).to receive(:write).with('RESULT')

      subject.save
    end
  end
end
