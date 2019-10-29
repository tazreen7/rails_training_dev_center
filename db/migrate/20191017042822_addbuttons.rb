class Addbuttons < ActiveRecord::Migration[6.0]
  def change
    add_column :associates, :edit, :string
    add_column :associates, :status, :string
  end
end
