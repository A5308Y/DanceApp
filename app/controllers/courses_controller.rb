require_relative '../presenters/courses_presenter'
require_relative '../fetchers/courses_fetcher'

class CoursesController < ApplicationController
  def index
    @presenter = CoursesPresenter.new(CoursesFetcher.new(Course.all))
  end
end
