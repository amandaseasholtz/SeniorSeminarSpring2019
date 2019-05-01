class CreateExpectedCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :expected_costs do |t|
      t.references :request, foreign_key: true
      t.decimal :cost

      t.timestamps
    end
  end
end
