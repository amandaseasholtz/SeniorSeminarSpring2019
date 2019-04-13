class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.references :budget, foreign_key: true
      t.string :did
      t.string :dname
      t.decimal :dbudget

      t.timestamps
    end
  end
end
