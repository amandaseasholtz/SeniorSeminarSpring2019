class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :purpose
      t.string :days
      t.string :destination
      t.string :expenses
      t.string :payment

      t.timestamps
    end
  end
end
