class CreateBorrows < ActiveRecord::Migration[5.0]
  def change
    create_table :borrows do |t|
      t.date :borrow_date
      t.date :expected_return_date
      t.date :return_date
      t.references :reader, foreign_key: true
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
