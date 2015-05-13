class CoursesIndexPresenter
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(fetcher)
    @fetcher = fetcher
  end

  def names
    @fetcher.names
  end

  def empty_collection_message
    @fetcher.nothing_found? ? "Sorry. We couldn't find any courses." : ''
  end

  def new_course_link
    url_helpers.new_course_path
  end
end
