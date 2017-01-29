class SearchController < ApplicationController

  before_action :authorize_librarians, only: [:search_users]

  # Searches book, authors and publishers.
  def search_all
    @books = search_books_by_title(params['query'])
    @authors = search_authors_by_name(params['query'])
    @publishers = search_publishers_by_name(params['query'])
  end

  # Searches books.
  def search_books
    if !params['title'].empty? && !params['author'].empty?
      @books = Book.joins(:author).where(["books.title like ? and authors.name like ?", '%' + params['title'] + '%','%'+ params['author']+'%'])
    elsif !params['title'].empty?
      @books = search_books_by_title(params['title'])
    elsif !params['author'].empty?
      @books = search_books_by_author(params['author'])
    end
  end

  # Searches authors by name.
  def search_authors
    @authors = search_authors_by_name(params['name'])
  end

  # Searches publishers by name.
  def search_publishers
    @publishers = search_publishers_by_name(params['name'])
  end

  # Searches users by email.
  def search_users
    @users = User.where(["email like ?", '%' + params['email'].downcase + '%'])
  end

  # Searches borrows by user email.
  def search_borrows
    @borrows = Borrow.joins("LEFT JOIN users ON borrows.reader_id = users.reader_id").where(["users.email LIKE ? ", params['email']])
  end

  # Searches books by ISBN.
  def search_books_by_isbn
    @books = Book.joins(:publications).where(["publications.ISBN = ?", params['isbn']])
  end

  # Searches books by title.
  # @param title title of the book
  private
  def search_books_by_title(title)
    return Book.where(["title like ?", '%' + title + '%'])
  end

  # Searches book by author.
  # @param author author's name
  private
  def search_books_by_author(author)
    return Book.joins(:author).where(["authors.name LIKE ?", '%' + author + '%'])
  end

  # Searches authors by name.
  # @param name auhor's name
  private
  def search_authors_by_name(name)
    return Author.where(["name like ?", '%' + name + '%'])
  end

  # Searches publishers by name.
  # @param name publisher's name
  private
  def search_publishers_by_name(name)
    return Publisher.where(["name like ?", '%' + name + '%'])
  end
end
