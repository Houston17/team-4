class AddBioToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :bio, :string
  end
end
