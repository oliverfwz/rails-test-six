FactoryGirl.define do
  factory :person do
    sequence(:first_name)   { |n| "User #{n}"}
    sequence(:last_name)    { |n| "Nguyen #{n}"}
    gender                  :male
    dob                     "06/04/1990"
    association             :father
    association             :mother
  end
end
