class AddPrivateToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :private, :boolean, default: false
  end
end
