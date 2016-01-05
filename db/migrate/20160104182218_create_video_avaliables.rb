class CreateVideoAvaliables < ActiveRecord::Migration
  def change
    create_table :video_avaliables do |t|
      t.integer :user_id
      t.integer :video_id
      t.integer :score
      t.timestamps null: false
    end
  end
end
