class CreateAssociates < ActiveRecord::Migration[6.0]
  def change
    create_table :associates do |t|
      t.string :leave_approval
      t.datetime :start_date
      t.datetime :end_date
      t.string :type_of_request
      t.string :cerner_id

      t.timestamps
    end
  end
end
