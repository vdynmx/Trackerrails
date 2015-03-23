class Track
  TRACKLINE_COLOR:   '#00FF00',
  TRACKLINE_OPACITY: 1
  TRACKLINE_WIDTH:   2

  initUi: ->
    @ui =
      map:        $ '.track-map'
      cropper:    $ '.cropper'
      beginInput: $ '#begin'
      endInput:   $ '#end'

    maxValue = @points.length - 1
    self = this
    @ui.cropper.slider
      range: true
      min: 0
      max: maxValue
      values: [0, maxValue]
      slide: ->
        setTimeout ->
          self.leftEnd = self.ui.cropper.slider 'values', 0
          self.rightEnd = self.ui.cropper.slider 'values', 1

          self.redrawCropMarkers()

          self.ui.beginInput.val self.leftEnd
          self.ui.endInput.val self.rightEnd
        , 100

  drawMap: ->
    mapOptions =
      center: new google.maps.LatLng(51.508742,-0.120850)
      zoom: 5,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    @map = new google.maps.Map @ui.map[0], mapOptions

  redrawCropMarkers: ->
    @cropMarkers.forEach (marker) ->
      marker.setMap null

    @cropMarkers.length = 0
    [@leftEnd, @rightEnd].forEach (pointIndex) =>
      @cropMarkers.push new google.maps.Marker
        position: @points[pointIndex]
        map: @map

  loadPoints: (successCallback) ->
    OnSuccess = (points) =>
      @trackEnds = []
      @points = points.map (point) =>
        if point.waypoint
          @trackEnds.push new google.maps.Marker
            position: new google.maps.LatLng(point.latitude, point.longtitude)
            icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
        new google.maps.LatLng(point.latitude, point.longtitude)

      successCallback()

    $.ajax
      url: '/tracks/' + @id + '/get_points'
      method: 'GET'
      success: OnSuccess

  drawTrack: ->
    new google.maps.Polyline
      path: @points
      map: @map
      strokeColor:   @TRACKLINE_COLOR,
      strokeOpacity: @TRACKLINE_OPACITY,
      strokeWeight:  @TRACKLINE_WIDTH

    @trackEnds.forEach (marker) =>
      marker.setMap @map

  constructor: (html) ->
    @id = $(html).find('#track_id').attr 'value'
    @cropMarkers = []
    @loadPoints =>
      @initUi()
      @drawMap()
      @drawTrack()
      # @setEventHandlers()

$ ->
  $.each $('.track'), (_, trackElement) ->
    new Track(trackElement)
