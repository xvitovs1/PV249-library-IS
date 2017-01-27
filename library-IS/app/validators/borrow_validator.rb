class BorrowValidator < ActiveModel::Validator
  def validate(record)
    publication = Publication.find_by id: record.publication_id
    return false unless publication
    return publication.available?
  end
end
