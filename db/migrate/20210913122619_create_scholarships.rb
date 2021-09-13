class CreateScholarships < ActiveRecord::Migration[6.0]
  def change
    create_table :scholarships do |t|
      t.string :title
      t.text :description
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
