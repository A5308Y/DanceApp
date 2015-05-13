require 'rails_helper'

describe 'Registering a new course', type: :feature do
  context "When I'm logged in as a teacher" do
    let!(:teacher) { User.create!(email: 'user@example.com', password: '123secret') }

    it 'allows me to enter its location' do
      log_in_as teacher
      click_link 'Neuer Kurs'

      fill_in 'Name', with: 'Flying below'
      fill_in 'Ort', with: 'Tanzfabrik Berlin'
      click_button 'Kurs registrieren'

      expect(page).to have_content 'Flying below'
    end
  end
end
