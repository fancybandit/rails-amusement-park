class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :height
      t.string :happiness
      t.string :nausea
      t.string :tickets
      t.string :password_digest
      t.boolean :admin, default: false
      
      t.timestamps null: false
    end
  end
end