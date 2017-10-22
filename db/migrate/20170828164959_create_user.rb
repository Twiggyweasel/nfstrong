# Creates Users table for User Model
class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :profile_pic
      t.boolean :has_nf, default: false
      t.boolean :child_w_nf
      t.integer :child_age, default: false
      t.boolean :email_communications, default: true
      t.timestamps
    end
  end
end
