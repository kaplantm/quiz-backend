class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.string :created_by
      t.boolean :public, :default => false
      t.integer :difficulty, :default => 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
