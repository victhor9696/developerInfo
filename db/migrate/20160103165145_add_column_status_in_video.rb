class AddColumnStatusInVideo < ActiveRecord::Migration
  def change
    add_column :videos, :status, :integer
  end
end
