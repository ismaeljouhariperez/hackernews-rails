class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :author, null: false
      t.integer :hackernews_id
      t.datetime :published_at
      t.integer :score, default: 0, null: false
      t.string :post_type

      t.timestamps
    end
    add_index :posts, :hackernews_id, unique: true
    add_index :posts, :score
    add_index :posts, :published_at
  end
end
