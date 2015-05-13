require_relative '../fetchers/courses_index_fetcher'
require_relative '../presenters/courses_index_presenter'
require_relative '../fetchers/courses_new_fetcher'
require_relative '../presenters/courses_new_presenter'

class CoursesController < ApplicationController
  def index
    @presenter = CoursesIndexPresenter.new(CoursesIndexFetcher.new(Course))
  end

  def new
    @presenter = CoursesNewPresenter.new(CoursesNewFetcher.new(Course))
  end

  def create
    Course.create(course_params)
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
