class AddPublishedOnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_on, :datetime
    add_index :posts, :published_on
  end
end
