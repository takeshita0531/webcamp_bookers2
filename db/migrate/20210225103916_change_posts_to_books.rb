class ChangePostsToBooks < ActiveRecord::Migration[5.0]
  def change
    rename_table :posts, :books
  end
end
