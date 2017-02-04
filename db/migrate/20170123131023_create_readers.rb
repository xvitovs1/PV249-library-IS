class CreateReaders < ActiveRecord::Migration[5.0]
  def change
    create_table :readers do |t|
      t.string :card_code

      t.timestamps
    end
  end
end
