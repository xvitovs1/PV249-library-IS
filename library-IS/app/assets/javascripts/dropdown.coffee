getParameterByName = (name, url) ->
  if !url
    url = window.location.href
  name = name.replace(/[\[\]]/g, '\\$&')
  regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)')
  results = regex.exec(url)
  if !results
    return null
  if !results[2]
    return ''
  decodeURIComponent results[2].replace(/\+/g, ' ')

ready = ->
  $("#birthdayPicker").birthdayPicker("defaultDate": getParameterByName('birthday'));
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
    $select_author = $('.select-author')
    author_name = $select_author.data('select2').$dropdown.find('input').val()
    $.post '/authors/add', {'name': author_name}, (payload) ->
      newOption = new Option(author_name, payload.author_id, false, true);
      $select_author.append(newOption).trigger('change');
      $select_author.select2('close');

  $(document).on 'click', '#add-publisher', () ->
    $select_publisher = $('.select-publisher')
    publisher_name = $select_publisher.data('select2').$dropdown.find('input').val()
    $.post '/publishers/add', {'name': publisher_name}, (payload) ->
      newOption = new Option(publisher_name, payload.publisher_id, false, true);
      $select_publisher.append(newOption).trigger('change');
      $select_publisher.select2('close');

$(document).on('turbolinks:load', ready)
