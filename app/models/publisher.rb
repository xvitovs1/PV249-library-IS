class Publisher < ApplicationRecord
  has_many :publications, :dependent => :destroy
  validates :name, presence: { message: "can't be blank" }
end
