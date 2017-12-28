root = exports ? this

$ ->
  $('#conflict-handler-settings input').each (i, obj) ->
    $(this).on 'change', () ->
      update_conflict_handler_settings($(this))

update_conflict_handler_settings = (obj) ->
  # Try first to get a value from the data tag.
  val = obj.data('value')
  # If there is no data tag, use the object's value.
  if !val
    val = obj.val()
  # Perform the request.
  $.ajax
    url: $('#conflict-handler-settings').data('set-key-path')
    type: 'POST'
    data:
      key: obj.data('key')
      value: val
    error: (xhr, status, text) ->
      show_error($('#js-data').data('js-error'))
  return false

