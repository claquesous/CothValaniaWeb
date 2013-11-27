$(document).ready ->
  hideAllButFirst = (e) ->
    console.log(e)
    first_found = false
    $('#wishlist select').each (i, item) ->
      item = $(item)
      if first_found && item.val() == ""
        item.closest('tr').hide()
      else if !first_found
        item.closest('tr').show()
        first_found = item.val() == ""
      true

  hideAllButFirst()
  $('#wishlist select').change (e) -> hideAllButFirst(e)
 
