class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.string :reasoning
      t.integer :field_num
      t.string :expected_expenses
      t.decimal :expected_costs
      t.string :payment_information
      t.string :budget_name

      
      t.string :employ_department
      #t.references :budget, foreign_key: true
      t.string :budget_department
      t.string :purpose




      t.string :status

      t.decimal :total_costs


      t.references :employee, foreign_key: true
      t.references :budget, foreign_key: true


      t.timestamps
    end
  end
end
