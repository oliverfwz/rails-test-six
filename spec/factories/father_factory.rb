FactoryGirl.define do
  factory :father do
    sequence(:first_name)   { |n| "User #{n}"}
    sequence(:last_name)    { |n| "Nguyen #{n}"}
    gender                  :male
    dob                     "06/04/1990"
  end
end
