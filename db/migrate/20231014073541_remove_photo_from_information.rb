class RemovePhotoFromInformation < ActiveRecord::Migration[7.0]
  def change
    remove_column :information, :photo, :string
  end
end
