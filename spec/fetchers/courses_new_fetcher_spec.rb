require_relative '../../app/fetchers/courses_new_fetcher'

describe CoursesNewFetcher do
  describe '#new_form_object' do
    let(:courses_relation) { double(:courses_relation) }
    let(:new_course) { double(:new_course) }

    subject { CoursesNewFetcher.new(courses_relation) }

    it 'creates a new object' do
      expect(courses_relation).to(receive(:new)).and_return new_course

      expect(subject.form_object).to be new_course
    end
  end
end
