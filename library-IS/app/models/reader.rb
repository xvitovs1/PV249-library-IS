class Reader < ApplicationRecord
  has_many :borrows
  has_one :user
end
