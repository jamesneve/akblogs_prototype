class AddEntryUrlToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :entry_url, :string
  	remove_column :posts, :content
  end
end
