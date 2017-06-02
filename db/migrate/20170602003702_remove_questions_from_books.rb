class RemoveQuestionsFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :question1
    remove_column :books, :question2
    remove_column :books, :question3
  end
end
