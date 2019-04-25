class CreateExpectedExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expected_expenses do |t|
      t.references :request, foreign_key: true
      t.string :expense

      t.timestamps
    end
  end
end
