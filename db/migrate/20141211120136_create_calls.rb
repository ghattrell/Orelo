class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.integer :user2_id
      t.string :room

      t.timestamps
    end
  end
end
