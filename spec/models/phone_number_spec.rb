require 'rails_helper'

RSpec.describe PhoneNumber, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "does not allow duplicate phone numbers" do
    contact = FactoryGirl.build(:contact)
    phone = FactoryGirl.create(:phone_number, contact: contact, number: 123456)
    phone = FactoryGirl.build(:phone_number, contact: contact, number: 123456)
    expect(phone).to be_invalid
  end

end
