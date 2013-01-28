class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email
      t.string    :hash_auth

      t.timestamps
    end
  end
end
