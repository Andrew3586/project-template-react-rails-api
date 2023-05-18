class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :dog_house
      t.text :review
      t.numeric :rating

      t.timestamps
    end
  end
end
