class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :actionreq, :string
    add_column :users, :location, :string
    add_column :users, :title, :string
  end
end
