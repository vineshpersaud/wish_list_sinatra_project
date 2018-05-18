class CreateItem< ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :quantity
    end
  end

  def down
    drop_table :items
  end
end