class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :category, null: false, foreign_key: true
      t.string :difficulty
      t.text :text
      t.text :answer_1
      t.text :answer_2
      t.text :answer_3
      t.text :answer_4
      t.string :correct

      t.timestamps
    end
  end
end
