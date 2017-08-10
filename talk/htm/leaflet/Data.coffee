
class Data

  constructor:( @Gis, @L ) ->
    @fbUrl = 'https://incandescent-inferno-3953.firebaseio.com/'
    @seg   = 'exitnow1/' + 'weather_poly/Weather_PolySegment: '
    @sns   = ['11','10','9','6','5060','4','3','2']
    @fb        = new Firebase( fbUrl )
    @pointsUrl = ''
    @points    = []
    @polyline  = {}

  getPoints:( path ) ->
    points = []
    path   = seg + sns[i] + '/Points'
    @fb.child(path).once('value', (snapshot) =>
      if snapshot.val()?
        points = snapshot.val()
      else
        Util.error( { op:'get', path:path, text:'Firebase get error' } )
    return


  getPoints = function( fb, path ) {
  fb.child(t+'/'+id).once('value', (snapshot) =>
  }

  for( i = 0; i < sns.length; i++ ) {

  polyline  = L.polyline(latlngs, {color: 'tan'}).addTo(Gis.map);
  // Gis.map.fitBounds(polyline.getBounds()); // zoom the map to the polyline
  }