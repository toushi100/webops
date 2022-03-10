class ChangeAuthorToString < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :author, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
