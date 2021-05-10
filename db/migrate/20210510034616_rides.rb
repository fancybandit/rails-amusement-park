class Rides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :user
      t.references :attraction

      t.timestamps null: false
    end
  end
end
