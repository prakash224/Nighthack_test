class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :subject
      t.integer :score
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
