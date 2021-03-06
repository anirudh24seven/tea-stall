class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :user
      t.string :name
      t.string :team
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
