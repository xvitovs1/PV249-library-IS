class CreateLibrarians < ActiveRecord::Migration[5.0]
  def change
    create_table :librarians do |t|
      t.string :card_code

      t.timestamps
    end
  end
end
