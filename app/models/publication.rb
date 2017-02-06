# Class that represents a copy of a book with isbn.
class Publication < ApplicationRecord
  belongs_to :publisher
  belongs_to :book
  validates :ISBN, presence: { message: "can't be blank" },
            uniqueness: { message: 'must be unique' }

  def available?
    borrows = Borrow.where(['publication_id = ? and return_date IS NULL', id])
    borrows.empty?
  end
end
