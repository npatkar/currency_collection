require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'npatkar@gmail.com'
    password 'aaaaaaaa'
    password_confirmation 'aaaaaaaa'
  end

  factory :country do
   name 'India' 
   code 'IND' 
   
  end

  factory :currency do
   name 'Rupaya' 
   code 'R' 
   country_id 'IND'
  end

end
