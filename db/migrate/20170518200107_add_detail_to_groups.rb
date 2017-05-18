class AddDetailToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :instructor, :string
    add_column :groups, :location, :string
    add_column :groups, :time, :string
  end
end
