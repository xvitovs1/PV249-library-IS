class Borrow < ApplicationRecord
  belongs_to :reader
  belongs_to :publication

  include ActiveModel::Validations
  validates_with BorrowValidator

  def active?
    return return_date.nil?
  end
end
