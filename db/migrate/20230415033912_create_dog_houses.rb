class CreateDogHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_houses do |t|
      t.string :name
      t.string :address
      t.references :user
      t.numeric :price
      t.string :capacity
      t.string :material

      t.timestamps
    end
  end
end
