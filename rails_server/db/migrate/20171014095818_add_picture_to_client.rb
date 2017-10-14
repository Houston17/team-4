class AddPictureToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :picture_url, :string
  end
end
