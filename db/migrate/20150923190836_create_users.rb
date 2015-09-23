class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps null: false
    end
  end
end
