# Class that represents author of a book.
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: { message: "can't be blank" }
end
