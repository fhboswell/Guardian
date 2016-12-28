class CreateIndividuals < ActiveRecord::Migration[5.0]
  def change
    create_table :individuals do |t|
      t.string :name
      t.string :check
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
