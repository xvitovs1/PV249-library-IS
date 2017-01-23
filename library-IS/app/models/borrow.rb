class Borrow < ApplicationRecord
  belongs_to :reader
  belongs_to :publication
end
