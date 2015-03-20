class Track
  TRACKLINE_COLOR:   '#FF0000',
  TRACKLINE_OPACITY: 1
  TRACKLINE_WIDTH:   2

  initUi: ->
    @ui =
      map: $ '.track-map'

  drawMap: ->
    mapOptions =
      center: new google.maps.LatLng(51.508742,-0.120850)
      zoom: 5,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    @map = new google.maps.Map @ui.map[0], mapOptions

  drawTrack: ->
    OnSuccess = (points) =>
      path = points.map (point) ->
        if point.waypoint
          new google.maps.Marker({ position: new google.maps.LatLng(point.longtitude, point.latitude) })
        new google.maps.LatLng(point.latitude, point.longtitude)

      new google.maps.Polyline
        path: path
        map: @map
        strokeColor:   @TRACKLINE_COLOR,
        strokeOpacity: @TRACKLINE_OPACITY,
        strokeWeight:  @TRACKLINE_WIDTH

    $.ajax
      url: '/tracks/' + @id + '/get_points'
      method: 'GET'
      success: OnSuccess

  constructor: (html) ->
    @id = $(html).find('#track_id').attr 'value'
    @initUi()
    @drawMap()
    @drawTrack()

$ ->
  $.each $('.track'), (_, trackElement) ->
    new Track(trackElement)
