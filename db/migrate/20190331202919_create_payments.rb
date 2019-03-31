class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :pid
      t.string :department
      t.string :title

      t.timestamps
    end
  end
end
