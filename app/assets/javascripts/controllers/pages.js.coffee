root = exports ? this

$ ->
  load_status_graph($('#conflict-status-chart'), 'conflict_status', render_conflict_status_graph)
  load_status_graph($('#bgp-status-chart'), 'bgp_status', render_bgp_status_graph)
  load_status_graph($('#timeline-conflicts-chart'), 'timeline_conflicts', render_timeline_conflicts_graph)

# Loads the data via AJAX.
load_status_graph = (obj, key, callback) ->
  $.ajax
    url: obj.data('load-path')
    type: 'GET'
    dataType: 'json'
    success: (data, status, response) ->
      graph_data =
        labels: []
        datas: []
        background_colors: []
        border_colors: []
      $.each $.parseJSON(data[key]), (idx, obj) ->
        graph_data['labels'].push(obj.label)
        graph_data['datas'].push(obj.count)
        graph_data['background_colors'].push(obj.background_color)
        graph_data['border_colors'].push(obj.border_color)
      callback(graph_data)
    error: (xhr, status, text) ->
      show_error($('#js-data').data('js-error'))
  return false

# Performs the rendering of the conflict status graph
render_conflict_status_graph = (graph_data) ->
  ctx = document.getElementById('conflict-status-chart').getContext('2d')
  myChart = new Chart(ctx,
    type: 'bar'
    data:
      labels: graph_data['labels']
      datasets: [ {
        data: graph_data['datas']
        backgroundColor: graph_data['background_colors']
        borderColor: graph_data['border_colors']
        borderWidth: 1
      } ]
    options:
      legend:
        display: false
      scales:
        yAxes: [ { ticks: beginAtZero: true } ])

# Performs the rendering of the bgp status graph
render_bgp_status_graph = (graph_data) ->
  ctx = document.getElementById('bgp-status-chart').getContext('2d')
  myChart = new Chart(ctx,
    type: 'pie'
    options:
      legend:
        display: false
    data:
      labels: graph_data['labels']
      datasets: [ {
        data: graph_data['datas']
        backgroundColor: graph_data['background_colors']
        borderColor: graph_data['border_colors']
        borderWidth: 1
      } ]
    )

# Performs the rendering of the render_timeline_conflicts_graph
render_timeline_conflicts_graph = (graph_data) ->
  ctx = document.getElementById('timeline-conflicts-chart').getContext('2d')
  myChart = new Chart(ctx,
    type: 'line'
    options:
      legend:
        display: false
    data:
      labels: graph_data['labels']
      datasets: [ {
        data: graph_data['datas']
        fill: false
      } ]
  )

