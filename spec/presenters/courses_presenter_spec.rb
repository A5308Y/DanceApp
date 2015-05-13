require_relative '../../app/presenters/courses_presenter'

describe CoursesPresenter do
  context 'if the fetcher returns ["Dance Dance Dance"] for names' do
    let(:fetcher) { double(names: ['Dance Dance Dance'], nothing_found?: false) }

    describe '#names' do
      subject(:subject) { CoursesPresenter.new(fetcher).names }

      it { is_expected.to match_array(['Dance Dance Dance']) }
    end

    describe '#empty_collection_message' do
      subject(:subject) { CoursesPresenter.new(fetcher).empty_collection_message }

      it { is_expected.to eq '' }
    end
  end

  context 'if the fechter returns no courses' do
    let(:fetcher) { double(nothing_found?: true) }

    describe '#empty_collection_message' do
      subject(:subject) { CoursesPresenter.new(fetcher).empty_collection_message }

      it { is_expected.to eq "Sorry. We couldn't find any courses." }
    end
  end
end
