class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    # Index
    add_index :reactions, [:user_id, :comment_id, :emoji], unique: true
    add_index :reactions, [:comment_id, :emoji]
  end
end