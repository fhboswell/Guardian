class AddIndividualidtouser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :individualid, :string, array: true, default: []
  end
end
