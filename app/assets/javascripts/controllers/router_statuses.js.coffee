root = exports ? this

$ ->
  rtr_table($('#rtr-status-entries'))
  $('#rtr-current-status-entries').DataTable
    paging: false
    searching: false
    info: false
    paginating: false

rtr_table = (table_obj) ->
  table_obj.on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax:
      url: table_obj.data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'router'}
      {data: 'created_at'}
      {data: 'state'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.
