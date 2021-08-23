class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :school_type
      t.string :address
      t.string :summary
      t.integer :founded_at
      t.integer :price
      t.integer :number_of_pupils
      t.integer :grade_5_or_above
      t.float :aab_or_above
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
