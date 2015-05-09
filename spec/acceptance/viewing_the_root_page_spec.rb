require 'spec_helper'

describe 'viewing the root page' do
  let!(:only_course) { Course.create!(name: 'Dancing with the devils') }

  it 'shows the list of all courses' do
    visit root_page
    expect(page).to have_content only_course.name
  end
end
