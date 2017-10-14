class AddStoryEmbedToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :embed_html, :string
  end
end
