FactoryGirl.define do
  factory :profile do
    first_name 'John'
    last_name 'Doe'
    career 'Educaiton'
    experience 10
    bio 'this is the bio'
    phone '1231231234'
    image nil
    city 'chicago'
    state 'il'
  end
end
