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
    ajax: $('#validated-roas-verified-announcements').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'route_validity'}
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.

