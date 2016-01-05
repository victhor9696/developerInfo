class CreateNewsAvaliables < ActiveRecord::Migration
  def change
    create_table :news_avaliables do |t|
      t.integer :user_id
      t.integer :news_id
      t.integer :score
      t.timestamps null: false
    end
  end
end
