root = exports ? this

$ ->
  $('.alert-data-container').each (i, obj) ->
    show_noty(
      $(this).data('message'),
      $(this).data('type'),
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
    timeout: timeout
    layout: 'topCenter'
    maxVisible: 3
  ).show()
  return

root.show_error = (msg) ->
  show_noty msg, 'error', 4000
  return

root.show_ok = (msg) ->
  show_noty msg, 'info', 4000
  return

root.show_notice = (msg) ->
  show_noty msg, 'info', 10000
  return
