class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false,
      t.string :created_by
      t.boolean :public :default => false
      t.integer :difficulty :default => 2

      t.timestamps
    end
  end
end
