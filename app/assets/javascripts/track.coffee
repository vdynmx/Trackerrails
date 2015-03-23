class Track
  TRACKLINE_COLOR:   '#FF0000',
  TRACKLINE_OPACITY: 1
  TRACKLINE_WIDTH:   2

  initUi: ->
    @ui =
      map:     $ '.track-map'
      cropper: $ '.cropper'

  setEventHandlers: ->
    @ui.cropper.on 'change', ->

  drawMap: ->
    mapOptions =
      center: new google.maps.LatLng(51.508742,-0.120850)
      zoom: 5,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    @map = new google.maps.Map @ui.map[0], mapOptions

  loadPoints: (successCallback) ->
    OnSuccess = (points) =>
      @points = points.map (point) ->
        new google.maps.LatLng(point.latitude, point.longtitude)
      successCallback()

    $.ajax
      url: '/tracks/' + @id + '/get_points'
      method: 'GET'
      success: OnSuccess

  drawTrack: ->
    @points.forEach (point) =>
      if point.waypoint
        new google.maps.Marker
          position: new google.maps.LatLng(point.latitude, point.longtitude)
          map: @map

      new google.maps.Polyline
        path: @points
        map: @map
        strokeColor:   @TRACKLINE_COLOR,
        strokeOpacity: @TRACKLINE_OPACITY,
        strokeWeight:  @TRACKLINE_WIDTH

  constructor: (html) ->
    @id = $(html).find('#track_id').attr 'value'
    @loadPoints =>
      @initUi()
      @drawMap()
      @drawTrack()
      @setEventHandlers()

$ ->
  $.each $('.track'), (_, trackElement) ->
    new Track(trackElement)
