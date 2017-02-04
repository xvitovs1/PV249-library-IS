class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :ISBN
      t.integer :year
      t.references :publisher, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
