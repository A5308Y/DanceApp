require 'lib_helper'
require 'documentation/raw_data'

describe Documentation::RawData do
  let(:feature_documentation_content) { double(:feature_documentation_content) }
  let(:developer_documentation_content) { double(:developer_documentation_content) }
  let(:introduction_content) { double(:introduction_content) }
  let(:feature_documentation_file) do
    double(:feature_documentation_file, read: feature_documentation_content)
  end
  let(:developer_documentation_file) do
    double(:developer_documentation_file, read: developer_documentation_content)
  end
  let(:introduction_file) { double(:introduction_file, read: introduction_content) }
  let(:io) { double(:io) }
  let(:config) do
    double(
      :config,
      feature_documentation_path: 'feature_documentation_path',
      unit_documentation_path: 'unit_documentation_path',
      introduction_path: 'introduction_path'
    )
  end

  subject(:result) { Documentation::RawData.new(config: config, io: io) }

  describe '#introduction_content' do
    it 'returns the content of the configured introduction_file' do
      expect(io).to receive(:open).with('introduction_path').and_return introduction_file
      expect(introduction_file).to receive(:read).and_return introduction_content

      expect(subject.introduction_content).to eq introduction_content
    end
  end

  describe '#feature_content' do
    it 'returns the content of the configured feature_documentation_file for features' do
      expect(io).to(
        receive(:open).with('feature_documentation_path').and_return feature_documentation_file
      )
      expect(feature_documentation_file).to receive(:read).and_return feature_documentation_content

      expect(subject.feature_content).to eq feature_documentation_content
    end
  end

  describe '#unit_test_content' do
    it 'returns the content of the configured feature_documentation_file for developers' do
      expect(io).to(
        receive(:open).with('unit_documentation_path').and_return developer_documentation_file
      )
      expect(developer_documentation_file).to(
        receive(:read).and_return developer_documentation_content
      )

      expect(subject.developer_content).to eq developer_documentation_content
    end
  end
end
