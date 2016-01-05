class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string  :title_br
      t.string  :title_es
      t.string  :description_br
      t.string  :description_es
      t.integer :user_id
    end
  end
end
