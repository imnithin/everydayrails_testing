# FactoryGirl.define do
#   factory :contact do
#     first_name "MyString"
# last_name "MyString"
#   end

# end

require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
  end
end
