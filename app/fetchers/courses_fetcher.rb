class CoursesFetcher
  def initialize(courses_relation)
    @courses_relation = courses_relation
  end

  def names
    @courses_relation.pluck(:name)
  end

  def nothing_found?
    @courses_relation.empty?
  end
end
