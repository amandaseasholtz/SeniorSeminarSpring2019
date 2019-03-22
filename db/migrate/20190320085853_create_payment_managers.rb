class CreatePaymentManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_managers do |t|
      t.string :name
      t.string :idNum
      t.string :department
      t.string :title

      t.timestamps
    end
  end
end
