class AddQuestionsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :question_1, :string
    add_column :books, :question_2, :string
    add_column :books, :question_3, :string
  end
end
