class AddLibrarianToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :librarian, foreign_key: true
  end
end
