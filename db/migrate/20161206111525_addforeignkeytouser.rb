class Addforeignkeytouser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :post_id, :integer
  end
end
