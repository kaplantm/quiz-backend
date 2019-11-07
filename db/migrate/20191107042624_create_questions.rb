class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :questionHeader
      t.string :question
      t.string :answer
      t.string :answerHeader
      t.integer :difficulty :default => 2
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
