class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :provider
      t.string :name
      t.string :email
      t.string :uid
      t.string :token
      t.string :image

      t.timestamps null: false
    end
  end
end
