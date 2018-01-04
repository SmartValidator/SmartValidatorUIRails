root = exports ? this

$ ->
  load_prefix_table()
  $('#conflict-handler-settings input').each (i, obj) ->
    $(this).on 'change', () ->
      return update_conflict_handler_settings($(this))
  $('#add-own-prefix-button').on 'click', () ->
    return new_own_prefix()

load_prefix_table = () ->
  $('#own-prefixes').on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax: $('#own-prefixes').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'prefix'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.


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
  return true

new_own_prefix = () ->
  own_prefix_button = $('#add-own-prefix-button')
  create_path = own_prefix_button.data('create-path')

  $.ajax
    url: own_prefix_button.data('new-path')
    type: 'GET'
    success: (data, status, response) ->
      root.reset_modal_window()
      $('#modal-template .modal-title').html(own_prefix_button.data('modal-title'))
      $('#modal-template .modal-body').html(data)
      $('#modal-template .btn.cancel').html($('#js-data').data('cancel'))
      $('#modal-template .btn.ok').off('click').html(own_prefix_button.data('modal-ok')).on 'click', ->
        $.ajax
          url: create_path
          type: 'POST'
          data:
            prefix: $('#own_prefix_prefix').val()
          success: (data, status, response) ->
            $('#modal-template').modal('hide')
            show_ok(own_prefix_button.data('modal-success'))
            $('#own-prefixes').DataTable().ajax.reload()
          error: (xhr, status, text) ->
            root.handle_modal_error(xhr)
        return false
      $('#modal-template').modal()
    error: (xhr, status, text) ->
      show_error($('#js-data').data('js-error'))
  return false


