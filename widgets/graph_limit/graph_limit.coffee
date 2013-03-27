class Dashing.GraphLimit extends Dashing.Widget

  @accessor 'current', ->
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    if points
      points[points.length - 1].y

  ready: ->
    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width  = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))
    @grphlimit = new Rickshaw.Graph(
      element: @node
      width: width
      height: height
      series: [
        {
        color: "#fff",
        data: [{x:0, y:0}]
        }
      ]
    )

    @graph.series[0].data = @get('points') if @get('points')

    x_axis = new Rickshaw.Graph.Axis.Time(graph: @grphlimit)
    y_axis = new Rickshaw.Graph.Axis.Y(graph: @grphlimit, tickFormat: Rickshaw.Fixtures.Number.formatKMBT)
    @grphlimit.render()

  onData: (data) ->
    if @grphlimit

      if parseInt(data.points[data.points.length - 1].y) > parseInt(document.getElementById('limitvalue').value)
        @grphlimit.series[0].color = "#dc5945"
      else
        @grphlimit.series[0].color = "#96bf48"

      @grphlimit.series[0].data = data.points
      @grphlimit.render()
