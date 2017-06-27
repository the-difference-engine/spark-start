require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'db' do 
    context 'columns' do
      it { should have_db_column(:data).of_type(:jsonb) }
      it { should have_db_column(:book_id).of_type(:integer) }
      it { should belong_to(:book) }
    end
  end
end
