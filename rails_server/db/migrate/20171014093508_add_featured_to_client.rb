class AddFeaturedToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :featured, :boolean, default: false
  end
end
