class Borrow < ApplicationRecord
  belongs_to :reader
  belongs_to :publication

  include ActiveModel::Validations
  validates_with BorrowValidator

  def active?
    return return_date.nil?
  end

  def get_user
    User.find_by reader_id: self.reader_id
  end
end
