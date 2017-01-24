class AddReaderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :reader, foreign_key: true
  end
end
