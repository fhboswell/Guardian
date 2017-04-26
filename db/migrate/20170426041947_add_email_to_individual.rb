class AddEmailToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_column :individuals, :email, :string
  end
end
