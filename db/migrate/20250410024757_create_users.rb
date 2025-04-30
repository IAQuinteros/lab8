class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false

      t.timestamps, null: false
    end
  end
end
