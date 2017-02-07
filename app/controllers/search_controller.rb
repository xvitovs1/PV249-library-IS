# Controller for searching.
class SearchController < ApplicationController
  before_action :authorize_librarians, only: [:search_users]

  # Searches book, authors and publishers.
  def search_all
    @books = search_books_by_title(params['query']).take(100)
    @authors = search_authors_by_name(params['query']).take(100)
    @publishers = search_publishers_by_name(params['query']).take(100)
  end

  # Searches books.
  def search_books
    if !params['title'].empty? && !params['author'].empty?
      @books = Book.joins(:author)
                   .where(['LOWER(books.title) LIKE ? and LOWER(authors.name) LIKE ?',
                           '%' + params['title'].downcase + '%',
                           '%' + params['author'].downcase + '%'])
                   .take(100)
    elsif !params['title'].empty?
      @books = search_books_by_title(params['title']).take(100)
    elsif !params['author'].empty?
      @books = search_books_by_author(params['author']).take(100)
    end
  end

  # Searches authors by name.
  def search_authors
    @authors = search_authors_by_name(params['name']).take(100)
  end

  # Searches publishers by name.
  def search_publishers
    @publishers = search_publishers_by_name(params['name']).take(100)
  end

  # Searches users by email.
  def search_users
    @users = User.where(['email like ?', '%' + params['email'].downcase + '%'])
                 .take(100)
  end

  # Searches borrows by user email.
  def search_borrows
    @borrows = Borrow.joins('LEFT JOIN users ON borrows.reader_id = users.reader_id')
                     .where(['users.email LIKE ? ',
                             params['email'].downcase]).take(100)
  end

  # Searches books by ISBN.
  def search_books_by_isbn
    @publications = Publication.where(['ISBN = ?', params['isbn']])
  end

  private

  # Searches books by title.
  # @param title title of the book
  def search_books_by_title(title)
    Book.where(['LOWER(title) like ?', '%' + title.downcase + '%'])
  end

  # Searches book by author.
  # @param author author's name
  def search_books_by_author(author)
    Book.joins(:author).where(['LOWER(authors.name) LIKE ?',
                               '%' + author.downcase + '%'])
  end

  # Searches authors by name.
  # @param name auhor's name
  def search_authors_by_name(name)
    Author.where(['LOWER(name) LIKE ?', '%' + name.downcase + '%'])
  end

  # Searches publishers by name.
  # @param name publisher's name
  def search_publishers_by_name(name)
    Publisher.where(['LOWER(name) LIKE ?', '%' + name.downcase + '%'])
  end
end
