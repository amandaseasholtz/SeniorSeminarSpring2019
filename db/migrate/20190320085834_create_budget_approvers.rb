class CreateBudgetApprovers < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_approvers do |t|
      t.string :name
      t.string :idNum
      t.string :department
      t.string :title

      t.timestamps
    end
  end
end
