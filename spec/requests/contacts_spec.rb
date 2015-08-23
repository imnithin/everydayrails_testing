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
      save_and_open_page
      expect{
        click_link 'New Contact'
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Smith'
        click_button 'Create Contact'
      }.to change(Contact, :count).by(1)
    end
  end
end
