class Publication < ApplicationRecord
  belongs_to :publisher
  belongs_to :book
  validates :ISBN, presence: { message: "can't be blank" }
end
