root = exports ? this

$ ->
  $('#local-announcements').on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable(
    processing: true
    serverSide: true
    ajax:
      url: $('#local-announcements').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'asn'}
      {data: 'prefix'}
      {data: 'blocking_status'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.
