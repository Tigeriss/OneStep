class AddImageLinkToNews < ActiveRecord::Migration
  def change
    add_column :news, :image_link, :string
  end
end
