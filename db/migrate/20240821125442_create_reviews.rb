class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :restaurant, null: false, foreign_key: true # restaurant_id

      t.timestamps
    end
  end
end
