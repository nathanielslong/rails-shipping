class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.belongs_to :boat, foreign_key: true
      t.belongs_to :job, foreign_key: true

      t.timestamps
    end
  end
end
