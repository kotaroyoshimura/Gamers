class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :genre_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
