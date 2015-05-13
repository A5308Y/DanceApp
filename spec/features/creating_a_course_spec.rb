require 'rails_helper'

describe 'Registering a new course', type: :feature do
  context "When I'm logged in as a teacher" do
    let!(:teacher) { User.create!(email: 'user@example.com', password: '123secret') }

    it 'allows me to enter its name' do
      log_in_as teacher
      click_link 'Neuer Kurs'

      fill_in 'Name', with: 'Flying below'
      click_button 'Kurs registrieren'

      expect(page).to have_content 'Flying below'
    end

    it 'will show error messages on a failed validation'
  end
end
