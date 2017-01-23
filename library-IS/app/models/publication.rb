class Publication < ApplicationRecord
  belongs_to :publisher
  belongs_to :book
  validates :ISBN, presence: { message: "can't be blank" }

  def available?
    borrows = Borrow.where(["publication_id = ? and return_date = ?", self.id, nil])
    return borrows.empty?
  end
end
