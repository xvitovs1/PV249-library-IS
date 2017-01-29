# Validator for borrows.
# Validates whether the publication exists and is available.
class BorrowValidator < ActiveModel::Validator
  def validate(record)
    publication = Publication.find_by id: record.publication_id
    if !publication
      record.errors[:publication] << 'Publication must exist!'
      return
    end
    if !publication.available?
      record.errors[:publication] << 'This publication is already borrowed!'
    end
  end
end
