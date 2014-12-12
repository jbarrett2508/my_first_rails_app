require 'rails_helper'

feature 'Creating Clients' do
  scenario 'can create an account' do
    visit '/'

    click_link 'Sign Up'

    fill_in 'First Name', with: 'Judith'
    fill_in 'Last Name', with: 'Barrett'
    fill_in 'Gender', with: 'Female'
    fill_in 'Age', with: '29'

    click_button 'Create Account'

    expect(page).to have_content('Account has been created')

    within('table') do
      expect(page).to have_content('Judith')
      expect(page).to have_content('Barrett')
      expect(page).to have_content('Female')
      expect(page).to have_content('29')
    end
  end

  scenario 'displays on homepage' do

    visit '/'

    expect(page).to have_content('First Name')
    expect(page).to have_content('Last Name')
    expect(page).to have_content('Gender')
    expect(page).to have_content('Age')
  end
end
