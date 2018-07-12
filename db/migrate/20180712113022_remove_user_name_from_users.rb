class RemoveUserNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_name, :string
  end
end
