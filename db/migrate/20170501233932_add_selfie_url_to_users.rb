class AddSelfieUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :selfieurl, :string
  end
end
