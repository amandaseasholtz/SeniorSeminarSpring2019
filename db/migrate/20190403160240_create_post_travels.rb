class CreatePostTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :post_travels do |t|
      t.string :name
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.text :purpose
      t.string :receipts_url
      t.decimal :expected_expenses
      t.decimal :actual_expenses
      t.string :receipt
      t.text :payment_infomation

      t.string :notes
      


      t.string :budget_status
      t.string :payment_status
      

      t.timestamps
    end
  end
end
