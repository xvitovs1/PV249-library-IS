class BorrowValidator < ActiveModel::Validator
  def validate(record)
    publication = Publication.find(record.publication_id)
    return publication.available?
  end
end
