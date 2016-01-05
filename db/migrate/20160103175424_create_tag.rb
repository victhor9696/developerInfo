class CreateTag < ActiveRecord::Migration
  def change
    drop_table :tags
    create_table :tags do |t|
      t.string   :name
      t.integer  :user_id
      t.integer  :status
    end
  end
end
