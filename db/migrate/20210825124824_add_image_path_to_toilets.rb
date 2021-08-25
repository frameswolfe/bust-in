class AddImagePathToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :image_path, :string
  end
end
