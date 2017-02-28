class CreatePort < ActiveRecord::Migration[5.0]
  def change
    create_table :ports do |t|
      t.string :city
      t.string :country
    end
  end
end
