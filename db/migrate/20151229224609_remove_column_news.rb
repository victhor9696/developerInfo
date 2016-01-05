class RemoveColumnNews < ActiveRecord::Migration
  def change
    remove_column :news, :slug_br
    remove_column :news, :slug_es
  end
end
