class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :location
      t.text :description
      t.string :access_info
      t.integer :cost_per_minute
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
