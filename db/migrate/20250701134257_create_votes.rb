class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    # Index unique pour éviter les doublons
    add_index :votes, [:user_id, :post_id], unique: true
  end
end
