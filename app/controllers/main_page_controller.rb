# Controller for main page.
class MainPageController < ApplicationController
  def index
    @new_books = Book.last(10)
  end
end
