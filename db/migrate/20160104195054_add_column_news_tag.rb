class AddColumnNewsTag < ActiveRecord::Migration
  def change
    add_column :news_tags, :locale_id, :integer
  end
end
