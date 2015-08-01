require 'rails_helper'

RSpec.describe Contact, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    contact = FactoryGirl.create(:contact)
    # contact = Contact.new(first_name: "nithin")
    expect(contact).to be_valid
  end

  it "is invalid without a first_name" do
    contact = FactoryGirl.build(:contact, first_name: nil)
    expect(contact).to be_invalid
  end

  it "is invalid without a last_name" do
    contact = FactoryGirl.build(:contact, last_name: nil)
    expect(contact).to be_invalid
  end

  it "returns contacts full name as string" do 
    contact = FactoryGirl.create(:contact, first_name: "nithin", last_name: "k")
    expect(contact.name).to eq("nithin k")
  end

  describe "filter based on last name" do 
    before :each do 
      @adam = FactoryGirl.create(:contact, first_name: "John", last_name: "adam")
      @smith = FactoryGirl.create(:contact, first_name: "John", last_name: "smith")
      @steve = FactoryGirl.create(:contact, first_name: "John", last_name: "steve")
      @ive = FactoryGirl.create(:contact, first_name: "John", last_name: "ive")
      @contact = Contact.search_letter_in_last_name("s")
    end

    it "search letter in last name" do
      expect(@contact).to eq [@smith, @steve]
    end

    it "does not include other names" do
      expect(@contact).not_to include @ive
    end
  end

end

