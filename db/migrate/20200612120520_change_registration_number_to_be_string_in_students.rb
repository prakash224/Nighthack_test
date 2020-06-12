class ChangeRegistrationNumberToBeStringInStudents < ActiveRecord::Migration[6.0]
  def change
    change_column :students, :registration_number, :string
  end
end
