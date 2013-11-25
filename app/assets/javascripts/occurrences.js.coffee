$(document).ready ->
  toggle_member = (checkbox) ->
    checked = checkbox.checked
    member_id = $(checkbox).closest('tr').data('member-id')
    $(".requirement-row").each ->
      $(@).toggle(checked) if $(@).data('member-id') == member_id
    $('#requirements-table').hide(300) if $('tr.requirement-row:visible').length == 0 
    $('#requirements-table').show(300) if checked && $('#requirements-table:hidden') 
    $(".reward-checkbox").each ->
      $(@).toggle(checked) if $(@).data('member-id') == member_id

  $('.requirement-row').hide()
  $(".reward-checkbox").hide()
  $('tr.attendee input[type=checkbox]:checked').each (i,input) ->
    toggle_member(input)
  $('#requirements-table').hide() if $('tr.requirement-row:visible').length == 0 
 
  $('tr.attendee').click (e) ->
    toggle_member(e.target)
