class AddTypeKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type_key, :string
  end
end
