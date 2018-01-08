root = exports ? this

$ ->
  root.load_prefix_table($('#own-prefixes'))
  $('#conflict-handler-settings input').each (i, obj) ->
    $(this).on 'change', () ->
      return update_conflict_handler_settings($(this))
  $('#add-own-prefix-button').on 'click', () ->
    return new_own_prefix()
  $('#simulator-settings input').each (i, obj) ->
    $(this).on 'change', () ->
      return update_simulator_settings($(this))

# Updates the conflict handler settings.
update_conflict_handler_settings = (obj) ->
  update_checkbox_setting(obj)

# Updates the simulator settings.
update_simulator_settings = (obj) ->
  update_checkbox_setting(obj)

# Updates the setting checkboxes.
update_checkbox_setting = (obj) ->
  # Try first to get a value from the data tag.
  val = obj.data('value')
  # If there is no data tag, use the object's value.
  if !val
    val = obj.val()
  # Perform the request.
  $.ajax
    url: $('#settings_index').data('set-key-path')
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


