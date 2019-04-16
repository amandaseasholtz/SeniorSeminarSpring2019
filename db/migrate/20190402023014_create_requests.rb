class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :destination
      t.date :start_date
      t.date :end_date

      t.string :reasoning
      t.string :employ_department
      t.string :budget_name
      t.decimal :expected_costs


      t.string :budget_department
      t.string :purpose
      t.string :expected_expenses
      t.string :payment_information
      t.string :status


      t.references :employee, foreign_key: true
      t.references :budget, foreign_key: true


      t.timestamps
    end
  end
end
