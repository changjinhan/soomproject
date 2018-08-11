class CreateSoomCards < ActiveRecord::Migration[5.1]
  def change
    create_table :soom_cards do |t|
      t.belongs_to :user
      t.string :friend_name
      t.string :image
      t.date :datetime
      t.string :category
      t.string :hashtag
      t.text :memo
      
      
      t.timestamps
    end
  end
end
