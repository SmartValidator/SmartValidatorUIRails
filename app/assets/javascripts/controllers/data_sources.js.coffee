$ ->
  $('#announcements-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#announcements-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'asn'}
      {data: 'prefix'}
    ]
