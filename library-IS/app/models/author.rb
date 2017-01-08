class Author < ApplicationRecord
  has_many :books, :dependent => :destroy
  validates :name, presence: { message: "can't be blank" }
end
