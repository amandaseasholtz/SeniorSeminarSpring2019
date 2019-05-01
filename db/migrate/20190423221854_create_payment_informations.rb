class CreatePaymentInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_informations do |t|
      t.references :request, foreign_key: true
      t.string :payment_information

      t.timestamps
    end
  end
end
