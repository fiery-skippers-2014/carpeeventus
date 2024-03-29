var map;

function initialize() {
  var mapOptions = {
    zoom: 15
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: "You've been carpe'd!"
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    handleNoGeolocation(false);
  }
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(function() {

  $('.find-event').on('click', getEvents)
})

var getEvents = function () {
  event.preventDefault();
  $('.events').html('<img src="/carpediem.gif" />')

    navigator.geolocation.getCurrentPosition(function(position) {
      var coords = [position.coords.latitude, position.coords.longitude]
      console.log(coords)

      var category = $('select.mycategory').val()
      var radius = $('select.mydistance').val()

      $.ajax({
      type: 'GET',
      url: '/location',
      data: {position: coords, category: category, radius: radius}
      })
      .done(function(data) {
        $('.events').html(data)
      })
  });
}
