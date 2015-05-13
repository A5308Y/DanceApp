class CoursesNewPresenter
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(fetcher)
    @fetcher = fetcher
  end

  def form_object
    @fetcher.form_object
  end
end
