require 'rails_helper'

describe 'viewing the root page', type: :feature do
  let!(:only_course) { Course.create!(name: 'Dancing with the devils') }

  it 'shows the list of all courses' do
    visit root_path

    expect(page).to have_content only_course.name
  end
end
