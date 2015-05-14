require 'rails_helper'

describe CoursesIndexPresenter do
  let(:presenter) { CoursesIndexPresenter.new(fetcher) }

  context 'if the fetcher returns ["Dance Dance Dance"] for names' do
    let(:fetcher) { double(names: ['Dance Dance Dance'], nothing_found?: false) }

    describe '#names' do
      subject(:subject) { presenter.names }

      it { is_expected.to match_array(['Dance Dance Dance']) }
    end

    describe '#empty_collection_message' do
      subject(:subject) { presenter.empty_collection_message }

      it { is_expected.to eq '' }
    end
  end

  context 'if the fechter returns no courses' do
    let(:fetcher) { double(nothing_found?: true) }

    describe '#empty_collection_message' do
      subject(:subject) { presenter.empty_collection_message }

      it { is_expected.to eq 'Keine Kurse gefunden' }
    end
  end
end
