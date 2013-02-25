class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :content
      t.integer :site_id

      t.timestamps
    end
  end
end
