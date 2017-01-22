class SearchController < ApplicationController
  def search_all

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
    @authors = Author.where(["name like ?", '%' + params['name'] + '%'])
  end

  def search_publishers
    @publishers = Publisher.where(["name like ?", '%' + params['name'] + '%'])
  end

  private
  def search_books_by_title(title)
    return Book.where(["title like ?", '%' + title + '%'])
  end

  def search_books_by_author(author)
    return Book.joins(:author).where(['authors.name LIKE ?', '%' + author + '%'])
  end

  def search_books_by_isbn(isbn)
    return Book.where(["isbn = ?", isbn])
  end
end
