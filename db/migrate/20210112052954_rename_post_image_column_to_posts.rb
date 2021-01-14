class RenamePostImageColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :post_image, :image_id
  end
end
