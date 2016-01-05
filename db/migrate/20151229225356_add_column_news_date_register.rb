class AddColumnNewsDateRegister < ActiveRecord::Migration
  def change
    add_column :news, :created_at, :datetime
    add_column :news, :updated_at, :datetime
  end
end
