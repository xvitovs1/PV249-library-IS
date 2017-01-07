class Book < ApplicationRecord
  belongs_to :author
  has_many :publications, :dependent => :destroy
end
