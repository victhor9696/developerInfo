class CreateCommentsNews < ActiveRecord::Migration
  def change
    create_table :comments_news do |t|
      t.string :message
      t.integer :news_id
      t.timestamps :date_register
      t.integer :status
    end
  end
end
