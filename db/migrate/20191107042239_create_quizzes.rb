class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :created_by
      t.boolean :public
      t.integer :difficulty

      t.timestamps
    end
  end
end
