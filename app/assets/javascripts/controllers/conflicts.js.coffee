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
    ]
  ).css('width', '100%') # The table don't get the proper width if its rendered in a hidden container. Therefore, we have to set this after the initialization.
  $('input[name="route_validity"]').on 'change', ->
    $('#validated-roas-verified-announcements').DataTable().ajax.reload()


