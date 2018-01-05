root = exports ? this

$ ->
  root.validated_roas_table($('#filtered-validated-roas-table'))
  root.validated_roas_table($('#whitelisted-validated-roas-table'))
  $('#validated-roas-verified-announcements').on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax:
      url: $('#validated-roas-verified-announcements').data('source')
      data: (d) ->
        d.routevalidity = $('input[name="route_validity"]:checked').data('value')
        return
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'announcement_asn'}
      {data: 'announcement_prefix'}
      {data: 'actions'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.
  $('input[name="route_validity"]').on 'change', ->
    $('#validated-roas-verified-announcements').DataTable().ajax.reload()

  $(document).ajaxComplete (event, request, settings) ->
    $('.analyzed-announcement-entry').each (i, obj) ->
      $(this).off('click').on 'click', ->
        show_analyzed_conflict_details($(this))
        return false

show_analyzed_conflict_details = (link) ->
  $.ajax
    url: link.data('show-path')
    type: 'GET'
    success: (data, status, response) ->
      root.reset_modal_window()
      $('#modal-template .modal-title').html($('#validated-roas-verified-announcements').data('modal-title'))
      $('#modal-template .modal-body').html(data)
      $('#modal-template .btn.cancel').hide()
      $('#modal-template .ok').off('click').on 'click', ->
        $('#modal-template').modal('hide')
      $('#modal-template').modal()
    error: (xhr, status, text) ->
      show_error($('#js-data').data('js-error'))
  return false
