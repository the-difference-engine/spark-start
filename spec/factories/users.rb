FactoryGirl.define do
    factory :user do
      email 'justinviegelahn@gmail.com'
      token 'abc123'
      role 'true'
      # password 'secret'
      # password_confirmation 'secret'
    end
end
