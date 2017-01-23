class SearchController < ApplicationController
  def search_all
    @books = search_books_by_title(params['query'])
    @authors = search_authors_by_name(params['query'])
    @publishers = search_publishers_by_name(params['query'])
  end

  def search_books
    if !params['title'].empty?
      @books = search_books_by_title(params['title'])
    elsif !params['author'].empty?
      @books = search_books_by_author(params['author'])
    else
      @books = search_books_by_author(params['isbn'])
    end
  end

  def search_authors
    @authors = search_authors_by_name(params['name'])
  end

  def search_publishers
    @publishers = search_publishers_by_name(params['name'])
  end

  private
  def search_books_by_title(title)
    return Book.where(["title like ?", '%' + title + '%'])
  end

  private
  def search_books_by_author(author)
    return Book.joins(:author).where(['authors.name LIKE ?', '%' + author + '%'])
  end

  private
  def search_books_by_isbn(isbn)
    return Book.where(["isbn = ?", isbn])
  end

  private
  def search_authors_by_name(name)
    return Author.where(["name like ?", '%' + name + '%'])
  end

  private
  def search_publishers_by_name(name)
    return Publisher.where(["name like ?", '%' + name + '%'])
  end
end
