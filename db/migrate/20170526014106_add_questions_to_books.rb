class AddQuestionsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :question1, :text
    add_column :books, :question2, :text
    add_column :books, :question3, :text
  end
end
