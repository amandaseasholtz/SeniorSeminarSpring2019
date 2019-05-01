class CreateActuals < ActiveRecord::Migration[5.2]
  def change
    create_table :actuals do |t|
      t.string :expense
      t.decimal :cost
      t.string :payment_information
      t.references :post_travel, foreign_key: true

      t.timestamps
    end
  end
end
