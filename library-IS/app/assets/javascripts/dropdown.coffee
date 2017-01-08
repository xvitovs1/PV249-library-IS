ready = -> 
 $('.dropdown-toggle').dropdown()
 $('.select-author').select2 
  placeholder: 'Select an author'
  language: noResults: -> "<input class='btn btn-default' id='add-author' type='button' value='Add author'>"
  escapeMarkup: (m) -> m

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
