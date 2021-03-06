# Validator for borrows.
# Validates whether the publication exists and is available.
class BorrowValidator < ActiveModel::Validator
  def validate(record)
    publication = Publication.find_by id: record.publication_id
    unless publication
      record.errors[:publication] << ' must exist!'
      return
    end
    unless publication.available?
      record.errors[:publication] << ' is already borrowed!'
    end
  end
end
