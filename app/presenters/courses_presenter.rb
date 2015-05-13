class CoursesPresenter
  def initialize(fetcher)
    @fetcher = fetcher
  end

  def names
    @fetcher.names
  end

  def empty_collection_message
    @fetcher.nothing_found? ? "Sorry. We couldn't find any courses." : ''
  end
end
