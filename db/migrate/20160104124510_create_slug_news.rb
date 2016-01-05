class CreateSlugNews < ActiveRecord::Migration
  def change
    add_column :news, :slug, :integer
    add_index :news, :slug, unique: true
  end
end
