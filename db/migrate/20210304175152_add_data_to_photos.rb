class AddDataToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :photo_set, :string
    add_column :photos, :number, :integer
    add_column :photos, :date, :string
    add_column :photos, :url, :text
    add_column :photos, :camera, :string
  end
end
