class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :number
  validates :number, uniqueness: { scope: :contact_id }
end
