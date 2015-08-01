class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :phone_numbers
  validates_presence_of :first_name, :last_name

  def name
    [first_name, last_name].join(" ")
  end

  def self.search_letter_in_last_name(letter)
    where("last_name LIKE ?", "#{letter}%").order(:last_name)
  end

end
