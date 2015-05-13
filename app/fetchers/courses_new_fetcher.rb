class CoursesNewFetcher
  def initialize(relation)
    @relation = relation
  end

  def form_object
    @relation.new
  end
end
