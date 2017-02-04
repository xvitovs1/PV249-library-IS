class AddColumnToPublications < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :book, foreign_key: true
  end
end
