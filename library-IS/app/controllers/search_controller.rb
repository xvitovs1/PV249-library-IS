class SearchController < ApplicationController
  def search_all

  end

  def search_books
  end

  def search_authors
    @authors = Author.where(["name like ?", '%' + params['name'] + '%'])
  end

  def search_publishers
  end
end
