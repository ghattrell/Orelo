class CreateDesiredLanguages < ActiveRecord::Migration
  def change
    create_table :desired_languages do |t|
      t.integer :user_id
      t.integer :language_id

      t.timestamps
    end
  end
end
