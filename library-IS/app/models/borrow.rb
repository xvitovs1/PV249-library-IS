class Borrow < ApplicationRecord
  belongs_to :reader
  belongs_to :publication

  def active?
    return return_date.nil?
  end
end
