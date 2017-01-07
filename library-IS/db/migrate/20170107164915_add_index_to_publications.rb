class AddIndexToPublications < ActiveRecord::Migration[5.0]
  def change
    add_index :publications, :ISBN, unique: true
  end
end
