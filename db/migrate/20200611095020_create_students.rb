class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :registration_number
      t.string :gender
      t.string :dob
      t.integer :year_of_registration
      t.string :batch
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
