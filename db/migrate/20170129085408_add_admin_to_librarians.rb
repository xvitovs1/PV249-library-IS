class AddAdminToLibrarians < ActiveRecord::Migration[5.0]
  def change
    add_column :librarians, :admin, :boolean, default: false
  end
end
