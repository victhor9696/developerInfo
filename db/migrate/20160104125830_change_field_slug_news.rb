class ChangeFieldSlugNews < ActiveRecord::Migration
  def change
    remove_column :news, :slug
    add_column :news, :slug, :string
    add_index :news, :slug, unique: true
  end
end
