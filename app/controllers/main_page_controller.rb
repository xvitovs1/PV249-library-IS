class MainPageController < ApplicationController
  def index
    @new_books = Book.last(10).reverse
  end
end
