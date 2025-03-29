class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
    add_column :users, :bio, :text
    add_column :users, :role, :string
    add_column :users, :active, :boolean
  end
end
