class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :First_Name
      t.string :Last_Name
      t.text :Experience
      t.string :image_url

      t.timestamps
    end
  end
end
