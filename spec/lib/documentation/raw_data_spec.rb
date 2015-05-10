require 'lib_helper'
require 'documentation/raw_data'

describe Documentation::RawData do
  let(:rspec_content) { double(:rspec_content) }
  let(:introduction_content) { double(:introduction_content) }
  let(:rspec_file) { double(:rspec_file, read: rspec_content) }
  let(:introduction_file) { double(:introduction_file, read: introduction_content) }
  let(:io) { double(:io) }
  let(:config) do
    double(:config, generated_rspec_path: 'rspec_path', introduction_path: 'introduction_path')
  end

  subject(:result) { Documentation::RawData.new(config: config, io: io) }

  describe '#introduction_content' do
    it 'returns the content of the configured introduction_file' do
      expect(io).to receive(:open).with('introduction_path').and_return introduction_file
      expect(introduction_file).to receive(:read).and_return introduction_content

      expect(subject.introduction_content).to eq introduction_content
    end
  end

  describe '#generated_rspec_content' do
    it 'returns the content of the configured rspec_file' do
      expect(io).to receive(:open).with('rspec_path').and_return rspec_file
      expect(rspec_file).to receive(:read).and_return rspec_content

      expect(subject.generated_rspec_content).to eq rspec_content
    end
  end
end
