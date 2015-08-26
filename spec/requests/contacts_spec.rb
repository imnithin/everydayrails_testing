require 'rails_helper'
require 'capybara/rails'
include Capybara::DSL
# RSpec.describe "Contacts", :type => :request do
#   describe "GET /contacts" do
#     it "works! (now write some real specs)" do
#       get contacts_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe "Contacts", :type => :request do
  describe "Manage Contacts" do
    
    it "Adds a new contact and displays" do
      visit contacts_url
      # save_and_open_page
      expect{
        click_link 'New Contact'
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Smith'
        click_button 'Create Contact'
      }.to change(Contact, :count).by(1)
      expect(page).to have_content("Contact was successfully created.") # have_text
      expect(page).to have_content("John") # have_text
    end

    it "deletes a contact", js: true do
      DatabaseCleaner.clean
      contact = FactoryGirl.create(:contact, first_name: "Chris", last_name: "Lynn")
      visit contacts_url
      expect{
        within "#contact_#{contact.id}" do
        click_link "Destroy"
      end
      # alert = page.driver.browser.switch_to.alert
      # alert.accept
      }.to change(Contact, :count).by(-1)
    end
  end
end
