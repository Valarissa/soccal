class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :role_id
      t.string :member_type
      t.integer :member_id
      t.string :group_type
      t.integer :group_id

      t.timestamps
    end
  end
end
