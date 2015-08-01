FactoryGirl.define do
  factory :phone_number do
    number 1
    contact nil
  end

end


# require 'faker'
#
# FactoryGirl.define do
#
#   factory :phone_number do |f|
#     f.number {Faker::Address.building_number }
#     # contact nil
#   end
#
# end
