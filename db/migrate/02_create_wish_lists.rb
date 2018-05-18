class CreateWishLists< ActiveRecord::Migration
  def up
    create_table :wish_lists do |t|
      t.string :name
      t.integer :user_id
    end
  end

  def down
    drop_table :wish_list
  end
end