class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :top_score
      t.references :user, null: false, foreign_key: true
      t.integer :category_id

      t.timestamps
    end
  end
end
