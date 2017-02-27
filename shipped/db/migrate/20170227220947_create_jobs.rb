class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.integer :needed_containers

      t.timestamps
    end
  end
end
