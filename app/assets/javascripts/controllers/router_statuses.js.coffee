root = exports ? this

$ ->
  $('#rtr-status-entries').on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax:
      url: $('#rtr-status-entries').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'router'}
      {data: 'start_time'}
      {data: 'end_time'}
      {data: 'state'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.
