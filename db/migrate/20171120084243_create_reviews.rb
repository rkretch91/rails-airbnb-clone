class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :user_rating
      t.integer :item_rating
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
