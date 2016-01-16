FactoryGirl.define do
  factory :mother do
    sequence(:first_name)   { |n| "User #{n}"}
    sequence(:last_name)    { |n| "Nguyen #{n}"}
    gender                  :female
    dob                     "06/04/1990"
  end
end
