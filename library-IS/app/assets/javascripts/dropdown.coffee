ready = -> 
 $('.dropdown-toggle').dropdown()
 $('select').select2 placeholder: 'Select an option'

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
