class CreateWishList< ActiveRecord::Migration
  def up
    create_table :wishlist do |t|
      t.string :name
      t.integer :user_id
    end
  end

  def down
    drop_table :users
  end
end