class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :content
      t.index ["title"], name: "index_posts_on_title", unique: true, using: :btree


      t.timestamps
    end
  end
end
