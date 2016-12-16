FactoryGirl.define do
  factory :post do
   title 'Test Post'
   author 'John Doe'
   body '1231231234'
   image_file_name nil
   image_content_type nil
   image_file_size nil
   image_updated_at nil
  end
end