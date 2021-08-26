class AddCoordinatesToToilet < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :latitude, :float
    add_column :toilets, :longitude, :float
  end
end
