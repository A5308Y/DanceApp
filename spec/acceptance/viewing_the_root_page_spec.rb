require 'rails_helper'

describe 'Viewing the root page', type: :feature do
  let!(:only_course) { Course.create!(name: 'Dancing with the devils') }

  before do
    visit root_path
  end

  it 'shows the list of all courses' do
    expect(page).to have_content only_course.name
  end

  context 'if a user exists' do
    let!(:user) { User.create!(email: 'Maria.peter@example.com', password: 'password') }

    it 'allows the user to log in' do
      click_link 'Login'
      fill_in 'Email', with: 'Maria.peter@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(page).to have_content 'Logged in as maria.peter@example.com'
    end
  end
end
