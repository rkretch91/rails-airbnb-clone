class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    remove_column :users, :email_address
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
