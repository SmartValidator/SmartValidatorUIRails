$ ->
  $('#announcements-table').on('xhr.dt', (e, settings, json, xhr) ->
    if xhr.status != 200
      location.href = $('#js-data').data('login-path')
      $(this).stopPropagation()
      return false
    return true
  ).dataTable
    processing: true
    serverSide: true
    ajax: $('#announcements-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'asn'}
      {data: 'prefix'}
    ]

