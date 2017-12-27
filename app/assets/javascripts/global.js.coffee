root = exports ? this

$ ->
  $('.alert-data-container').each (i, obj) ->
    show_noty(
      $(this).data('message')
      $(this).data('type'),
      5000
    )
    return

  $(".chosen-select").chosen
    disable_search_threshold: 6
    width: '100%'

show_noty = (msg, type, timeout) ->
  new Noty(
    text: msg
    type: type
    theme: 'bootstrap-v4'
    layout: 'topCenter'
    timeout: timeout
    maxVisible: 3
  ).show()
  return

root.show_error = (msg) ->
  show_noty msg, 'error', 7000
  return

root.show_ok = (msg) ->
  show_noty msg, 'success', 5000
  return

root.show_info = (msg) ->
  show_noty msg, 'info', 5000
  return
