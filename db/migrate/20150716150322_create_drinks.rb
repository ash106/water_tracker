class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :volume
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
