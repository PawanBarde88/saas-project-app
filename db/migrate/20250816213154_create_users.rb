class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end
    acts_as_tenant(:account)
  end

