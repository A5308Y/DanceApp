require_relative '../../app/fetchers/courses_index_fetcher'

describe CoursesIndexFetcher do
  describe 'does all the fetching on models,
    so it should be the only thing Course related that has any ActiveRecord vocabulary in it'

  let(:courses_relation) { double(:courses_relation) }
  let(:courses_class) { double(:courses_class, all: courses_relation) }

  describe '#names' do
    subject { CoursesIndexFetcher.new(courses_class).names }

    context 'if only one course is present' do
      before do
        expect(courses_class).to receive(:pluck).with(:name).and_return ['Dance Dance Dance']
      end

      it 'returns a list of names from the database for a given list of courses' do
        is_expected.to match_array ['Dance Dance Dance']
      end
    end

    context 'if two courses are present' do
      before do
        expect(courses_class).to receive(:pluck).with(:name).and_return ['Dance', 'Step Up']
      end

      it 'returns a list of names from the database for a given list of courses' do
        is_expected.to match_array ['Dance', 'Step Up']
      end
    end
  end

  describe '#nothing_found?' do
    subject { CoursesIndexFetcher.new(courses_class).nothing_found? }

    context 'if the given collection is empty' do
      let(:courses_relation) { double(:coures_relation, empty?: true) }
      it { is_expected.to be_truthy }
    end

    context 'if the given collection is not empty' do
      let(:courses_relation) { double(:coures_relation, empty?: false) }
      it { is_expected.to be_falsey }
    end
  end
end
