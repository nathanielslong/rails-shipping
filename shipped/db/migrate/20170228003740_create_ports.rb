class CreatePorts < ActiveRecord::Migration[5.0]
  def change
    create_table :ports do |t|
      t.string :location

      t.timestamps
    end
  end
end
