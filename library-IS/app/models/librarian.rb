class Librarian < ApplicationRecord
  has_one :user
  validates :card_code, presence: {message: "can't be blank"}
end
