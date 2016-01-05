class AddColumnNewsTag2 < ActiveRecord::Migration
  def change
    remove_column :news_tags, :locale_id
    add_column :tags, :locale_id, :integer
  end
end
