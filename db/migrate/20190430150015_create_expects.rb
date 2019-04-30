class CreateExpects < ActiveRecord::Migration[5.2]
  def change
    create_table :expects do |t|
      t.string :expected_expenses
      t.decimal :expected_costs
      t.string :payment_information
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
