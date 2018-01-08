root = exports ? this

$ ->
  root.abstract_announcements_table('#watched-announcements')
  $('#add-watched-prefix-button').on 'click', () ->
    return new_watched_prefix()

new_watched_prefix = () ->
  watched_prefix_button = $('#add-watched-prefix-button')
  create_path = watched_prefix_button.data('create-path')

  $.ajax
    url: watched_prefix_button.data('new-path')
    type: 'GET'
    success: (data, status, response) ->
      root.reset_modal_window()
      $('#modal-template .modal-title').html(watched_prefix_button.data('modal-title'))
      $('#modal-template .modal-body').html(data)
      $('#modal-template .btn.cancel').html($('#js-data').data('cancel'))
      $('#modal-template .btn.ok').off('click').html(watched_prefix_button.data('modal-ok')).on 'click', ->
        $.ajax
          url: create_path
          type: 'POST'
          data:
            prefix: $('#watched_prefix_prefix').val()
          success: (data, status, response) ->
            $('#modal-template').modal('hide')
            show_ok(watched_prefix_button.data('modal-success'))
            $('#watched-prefixes').DataTable().ajax.reload()
          error: (xhr, status, text) ->
            root.handle_modal_error(xhr)
        return false
      $('#modal-template').modal()
    error: (xhr, status, text) ->
      show_error($('#js-data').data('js-error'))
  return false
