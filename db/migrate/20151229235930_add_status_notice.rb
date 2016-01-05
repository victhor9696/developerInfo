class AddStatusNotice < ActiveRecord::Migration
  def change
    add_column :news, :status, :integer
  end
end
