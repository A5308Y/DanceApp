class CoursesIndexPresenter
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(fetcher)
    @fetcher = fetcher
  end

  def names
    @fetcher.names
  end

  def empty_collection_message
    @fetcher.nothing_found? ? I18n.t('no_courses_message') : ''
  end

  def new_course_link
    url_helpers.new_course_path
  end
end
