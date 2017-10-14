class AddIconToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :icon, :string
  end
end
