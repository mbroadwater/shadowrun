class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passwor_digest, :string
  end
end
