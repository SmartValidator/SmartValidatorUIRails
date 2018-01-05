root = exports ? this

$ ->
  root.announcement_table($('#announcements-table'), update_counter_badge)
  root.validated_roas_table($('#validated-roas-table'), update_counter_badge)

# Updates the counter badges.
update_counter_badge = (model, json) ->
  if json && json['recordsTotal'] && model
    $('#' + model + '-count').html(root.format_number(json['recordsTotal']))

