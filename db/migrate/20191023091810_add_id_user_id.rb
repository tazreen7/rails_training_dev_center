class AddIdUserId < ActiveRecord::Migration[6.0]
  def change
      add_column :associates, :user_id, :integer
  end
end
