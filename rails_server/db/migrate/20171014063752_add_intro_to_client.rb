class AddIntroToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :intro, :string
  end
end
