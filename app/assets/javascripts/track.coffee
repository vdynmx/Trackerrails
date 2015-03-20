class Track
  TRACKLINE_COLOR:   '#FF0000',
  TRACKLINE_OPACITY: 1
  TRACKLINE_WIDTH:   3

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
        new google.maps.LatLng(parseFloat(point.latitude), parseFloat(point.longtitude))

      polyline = new google.maps.Polyline
        path: path
        strokeColor:   @TRACKLINE_COLOR,
        strokeOpacity: @TRACKLINE_OPACITY,
        strokeWeight:  @TRACKLINE_WIDTH

      polyline.setMap @map

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
