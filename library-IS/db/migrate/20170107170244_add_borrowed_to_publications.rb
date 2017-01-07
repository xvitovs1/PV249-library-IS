class AddBorrowedToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :borrowed, :boolean, default: false
  end
end
