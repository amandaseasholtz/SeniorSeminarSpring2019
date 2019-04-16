class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :bid
      t.string :department
      t.decimal :dmoney
      #t.decimal :department
      t.string :title

      t.timestamps
    end
  end
end
