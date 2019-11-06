class Addfield < ActiveRecord::Migration[6.0]
  def change
    remove_column :associates, :leave_approval, :boolean
    add_column :associates, :leave_approval, :string
    add_column :associates, :email, :string
  end
end
