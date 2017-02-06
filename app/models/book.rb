# Class that represents a book.
class Book < ApplicationRecord
  belongs_to :author
  has_many :publications, dependent: :destroy
  validates :title, presence: { message: "can't be blank" }
  validates :author, presence: { message: "can't be blank" }
end
