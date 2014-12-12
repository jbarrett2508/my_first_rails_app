require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user at signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'First Name', with: 'Judith'
    fill_in 'Last Name', with: 'Barrett'
    fill_in 'Username', with: 'barrettj'
    fill_in 'Password', with: 'sup3rs3krit'

    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up, Judith!')
    expect(page).to have_text('Signed in as barrettj')
    expect(ActionMailer::Base.deliveries).to have(1).email
  end

  scenario 'allows existing users to login' do
    user = FactoryGirl.create(:user, password: 'sup3rs3krit')

    visit '/'

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Login'
    expect(page).to have_text("Welcome back #{user.first_name.titleize}")
    expect(page).to have_text("Signed in as #{user.username}")
  end

  scenario 'does not allow existing users to log in with an invalid password' do
    user = FactoryGirl.create(:user, password: 'sup3rs3krit')

    visit '/'

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'NOT_YOUR_PASSWORD'

    click_button 'Login'
    expect(page).to have_text("Invalid username or password. Please try again.")
  end

  scenario 'allows a logged in user to logout' do

    user = FactoryGirl.create(:user, password: 'sup3rs3krit')


    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Login'

    visit '/'

    expect(page).to have_text("Signed in as #{user.username}")

    expect(page).to have_link('Logout')

    click_link 'Logout'

    expect(page).to have_text("#{user.username} has been logged out")
    expect(page).to_not have_text("Welcome back #{user.first_name.titleize}")
    expect(page).to_not have_text("Signed in as #{user.username}")
  end
end
