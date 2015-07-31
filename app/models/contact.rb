class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :phone_numbers
end
