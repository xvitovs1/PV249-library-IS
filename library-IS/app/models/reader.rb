class Reader < ApplicationRecord
  has_many :borrows, :dependent => :destroy
  has_one :user
  validates :card_code, presence: { message: "can't be blank" }
end
