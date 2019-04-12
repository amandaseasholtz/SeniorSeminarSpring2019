class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :bid
      #t.decimal :department
      t.decimal :department
      t.string :title

      t.timestamps
    end
  end
end
