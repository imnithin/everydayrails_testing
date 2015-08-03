class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :number, :phone_type
  validates :number, uniqueness: { scope: :contact_id }
end
