class CreateNewsTags < ActiveRecord::Migration
  def change
    create_table :news_tags do |t|
      t.integer   :news_id
      t.integer   :tag_id
    end
  end
end
