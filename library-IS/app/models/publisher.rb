class Publisher < ApplicationRecord
  has_many :publications, :dependent => :destroy
end
