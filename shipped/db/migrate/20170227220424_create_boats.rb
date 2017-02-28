class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :location
      t.integer :total_containers
      t.integer :available_containers

      t.timestamps
    end
  end
end
