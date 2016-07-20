class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :picture, default: 'https://worldarts2015.s3-us-west-2.amazonaws.com/images/default-profile-picture.jpg'
      t.boolean :admin, default: false
      t.index ["email"], name: "index_users_on_email", unique: true, using: :btree

      t.timestamps
    end
  end
end
