class AddColumnsToCollege < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :name, :string
    add_column :colleges, :code, :string
  end
end
