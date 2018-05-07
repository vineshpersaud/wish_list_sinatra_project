class CreateUser < ActiveRecord::Migration
  def up
    create :user do |t|
      t.string :username
      t.string :email
      t.string :password_digest
    end
  end

  def down
    drop_table :users
  end
end