class AddColumnCommentsLocale < ActiveRecord::Migration
  def change
    add_column :comments_news, :locale_id, :integer
  end
end
