FactoryGirl.define do
    factory :user do
      email 'justinviegelahn@gmail.com'
      token 'abc123'
      # password 'secret'
      # password_confirmation 'secret'
      admin true
    end
end
