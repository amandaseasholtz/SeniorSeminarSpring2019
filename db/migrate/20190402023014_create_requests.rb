class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :destination
      t.string :requested_travel_days
      t.string :purpose
      t.string :expected_expenses
      t.string :payment_information
      

      t.timestamps
    end
  end
end
