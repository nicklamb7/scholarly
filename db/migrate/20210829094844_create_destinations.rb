class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :birmingham
      t.integer :bristol
      t.integer :cambridge
      t.integer :cardiff
      t.integer :durham
      t.integer :edinburgh
      t.integer :exeter
      t.integer :glasgow
      t.integer :imperial
      t.integer :kcl
      t.integer :leeds
      t.integer :liverpool
      t.integer :lse
      t.integer :manchester
      t.integer :newcastle
      t.integer :nottingham
      t.integer :oxford
      t.integer :qmul
      t.integer :queens
      t.integer :sheffield
      t.integer :southampton
      t.integer :ucl
      t.integer :warwick
      t.integer :york
      t.integer :st_andrews
      t.integer :bath
      t.integer :loughborough
      t.integer :lancaster

      t.timestamps
    end
  end
end
