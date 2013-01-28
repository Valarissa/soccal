class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :shareable_id
      t.string :shareable_type
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
