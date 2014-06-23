require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest
  test "user signs up" do
    visit '/users/sign_up'
    fill_in 'Email', :with => 'asdf@pl.pl'
    fill_in 'Password', :with => 'password123'
    fill_in 'Password confirmation', :with => 'password123'
    click_button 'Sign up'
    assert has_content? 'Welcome! You have signed up successfully.'
  end

  test "user signs in" do
    visit '/users/sign_in'
    fill_in 'Email', :with => users(:one).email
    fill_in 'Password', :with => 'pass123456'
    click_button 'Sign in'
    assert has_content? 'Signed in successfully.'
  end

  test 'user signs out' do
    visit '/users/sign_in'
    fill_in 'Email', :with => users(:one).email
    fill_in 'Password', :with => 'pass123456'
    click_button 'Sign in'
    click_link 'Logout'
    assert has_content? 'Signed out successfully.'
  end
  
end
