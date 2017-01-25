ready = ->
  $('.dropdown-toggle').dropdown()

  $select_author = $('.select-author')
  $select_publisher = $('.select-publisher')
  $select_book = $('.select-isbn')

  $select_author.select2
    placeholder: 'Select an author'
    language: noResults: -> "<input class='btn btn-default' id='add-author' type='button' value='Add author'>"
    escapeMarkup: (m) -> m

  $select_publisher.select2
    placeholder: 'Select a publisher'
    language: noResults: -> "<input class='btn btn-default' id='add-publisher' type='button' value='Add publisher'>"
    escapeMarkup: (m) -> m

  $select_book.select2
    placeholder: 'Select a book'
    language: noResults: -> "Book with this ISBN is not available."

  $(document).on 'click', '#add-author', () ->
    author_name = $select_author.data('select2').$dropdown.find('input').val()
    $.post '/authors/add', {'name': author_name}, (payload) ->
      newOption = new Option(author_name, payload.author_id, false, true);
      $select_author.append(newOption).trigger('change');
      $select_author.select2('close');

  $(document).on 'click', '#add-publisher', () ->
    publisher_name = $select_publisher.data('select2').$dropdown.find('input').val()
    $.post '/publishers/add', {'name': publisher_name}, (payload) ->
      newOption = new Option(publisher_name, payload.publisher_id, false, true);
      $select_publisher.append(newOption).trigger('change');
      $select_publisher.select2('close');

$(document).on('turbolinks:load', ready)
