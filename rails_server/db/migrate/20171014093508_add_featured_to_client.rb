class AddFeaturedToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :featured, :bool, default: false
  end
end
