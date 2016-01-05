class AddSlugNews < ActiveRecord::Migration
  def change
    add_column :news, :slug_br, :string
    add_index  :news, :slug_br, unique: true
    add_column :news, :slug_es, :string
    add_index  :news, :slug_es, unique: true
  end
end
