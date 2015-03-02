require 'rails_helper'

# feature 'User Management' do
#   scenario 'New user sign up' do
#     visit root_path
#     save_and_open_page
#     page.find("#signup").click
#     save_and_open_page
#     first('#signup-form') do
# 	    fill_in 'user[name]', with: 'Jane Doe'
# 	    fill_in 'user[password]', with: '123'
# 	    fill_in 'user[password_confirmation]', with: '123'
# 	    save_and_open_page
# 	    click_button 'Submit'
# 		end
#     # expect(page).to have_content "Welcome"
#     # ('div.alert alert-success').text.should == 'Welcome Jane Doe!'
#     body.should have_content("Log Out")
#   end
# end

feature 'Registering' do

  describe "Creating a new user" do
    it "must save user if the text input into 'password' and 'password confirmation' field is the same" do
      user = User.new(name: "dwight", password: "123", password_confirmation: "123")
      user.save
      expect(user).to be_valid
    end

  	it "must not save the user if the text input into 'password' and 'password confirmation' do not match" do
	    u = User.create(
	    name: "pam",
	    password: "123",
	    password_confirmation: "456")
	    expect(u).to_not be_valid
  	end
  end

end

feature 'Logging in' do

  describe "authentication" do
    let(:user) { User.create(
    name: "jim",
    password: "123",
    password_confirmation: "123") }

    it "authenticates with a correct password" do
      expect(user.authenticate("123")).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("456")).to_not be
    end
  end

# feature 'Logging out' do

# 	describe "log out" do
# 		let(:user) { User.create(
#     name: "jim",
#     password: "123",
#     password_confirmation: "123") }
# end

end