FactoryGirl.define do
  factory :child do
    sequence(:first_name)   { |n| "User #{n}"}
    sequence(:last_name)    { |n| "Nguyen #{n}"}
    gender                  :male
    dob                     "06/04/2010"
    association             :father
    association             :mother
  end
end
