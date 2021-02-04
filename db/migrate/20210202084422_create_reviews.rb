class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      # t.references :user
      t.string :content
      t.references :booking
      t.integer :rating

      t.timestamps
    end
  end
end
