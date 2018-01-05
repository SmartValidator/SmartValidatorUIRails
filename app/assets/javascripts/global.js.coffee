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

root.announcement_table = (table_obj, callback = null) ->
  table_obj.on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    else
      if callback
        callback('announcements', json)
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax: table_obj.data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'asn'}
      {data: 'prefix'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.


root.validated_roas_table = (table_obj, callback = null) ->
  table_obj.on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      return false
    else
      if callback
        callback('roas', json)
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax: table_obj.data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'asn'}
      {data: 'prefix'}
      {data: 'max_length'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.

# Some modal dialogs change buttons or hide them.
# This method should be called before every configuration
# of a new dialog to reset the potentially changed template.
root.reset_modal_window = () ->
  $('#modal-template .ok').show().html($('#js-data').data('ok'))
  $('#modal-template .btn.cancel').show().html($('#js-data').data('cancel'))
  return


# Handles an error result from the controller.
root.handle_modal_error = (xhr) ->
  response = $.parseJSON(xhr['responseText'])
  errors = response['errors']
  if errors
    error_text = ''
    $.each errors, (key, value) ->
      error_text += key + ': ' + value
    root.show_error(error_text)
  else
    root.show_error($('#js-data').data('js-error'))

# Formats a number for pretty printing.
root.format_number = (n) ->
  return n

