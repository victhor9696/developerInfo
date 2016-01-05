class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title_br
      t.string :title_es
      t.text :description_br
      t.text :description_es
      t.string :iframe
      t.string :slug
    end
    add_index :videos, :slug, unique: true
  end
end
