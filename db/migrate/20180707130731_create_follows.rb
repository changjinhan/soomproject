class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      #t.integer :follower_id
      #t.integer :followed_id
      t.belongs_to :follower, null: false, foreign_key: { to_table: :users }
      t.belongs_to :followee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
