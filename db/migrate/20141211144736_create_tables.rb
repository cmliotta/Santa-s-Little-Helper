class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.integer :hoo_id # giftee, hoo
      t.integer :group_id

      t.timestamps
    end
  end
end
