require 'csv'

# Imports books to a database from a csv file from
# http://www2.informatik.uni-freiburg.de/~cziegler/BX/
# Broken rows must be removed before running this task.

namespace :import do
  desc "Imports books from given csv file"
  task :import_books_from_csv, [:file] => :environment do |t, args|
    books_csv = CSV.read(args[:file], { :col_sep => ";", :skip_blanks => true, :encoding => 'ISO-8859-2' })
    save_to_db(books_csv)
  end

private

# Goes through csv records and saves them to a DB.
# @param parsed_csv parsed csv file with books
def save_to_db(parsed_csv)
  parsed_csv.each do |record|
    next unless !record[0].end_with?("X")
    author = Author.find_by name: record[2]
    if !author
      author = Author.new(name: record[2])
      author.save
    end
    book = Book.find_by title: record[1], author_id: author.id
    if !book
      book = Book.new(title: record[1], author_id: author.id)
      book.save
    end
    publisher = Publisher.find_by name: record[4]
    if !publisher
      publisher = Publisher.new(name: record[4])
      publisher.save
    end
    publication = Publication.new(year: record[3], book_id: book.id, ISBN: record[0], publisher_id: publisher.id)
    publication.save
  end
end

end
