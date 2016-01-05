class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :news, :description_br, :text
    change_column :news, :description_es, :text
  end
end
