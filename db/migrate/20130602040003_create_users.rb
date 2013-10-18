class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :is_locked
      t.datetime :last_login_at
      t.string :last_login_ip

      t.timestamps
    end
  end
end
