class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :university
      t.integer :number_of_students
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
