class Track
  initUi: ->
    @ui =
      map: $ '.track-map'

  drawMap: ->
    mapOptions =
      center: new google.maps.LatLng(51.508742,-0.120850)
      zoom: 5,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    new google.maps.Map @ui.map[0], mapOptions

  constructor: (html) ->
    @initUi()
    @drawMap()

$ ->
  $.each $('.track'), (_, trackElement) ->
    new Track(trackElement)
