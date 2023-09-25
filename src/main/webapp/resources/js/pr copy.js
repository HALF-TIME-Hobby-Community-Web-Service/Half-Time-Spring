(() => {

  let map, infoWindow;
  let pos;
  infoWindow = new google.maps.InfoWindow();

  navigator.geolocation.getCurrentPosition(
    (position) => {
      pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent("현재 위치입니다.");
      infoWindow.open(map);
      map.setCenter(pos);
    },
  )

  function initMap(pos) {
    map = new google.maps.Map($("#map")[0], {
      center: { lat: pos.lat, lng: pos.lng },
      zoom: 10,

    });
  }
  window.initMap=initMap;
})









const locationButton = document.createElement("button");

locationButton.textContent = "Pan to Current Location";
locationButton.classList.add("custom-map-control-button");
map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
locationButton.addEventListener("click", () => {
  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      (position) => {
        pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent("Location found.");
        infoWindow.open(map);
        map.setCenter(pos);
      },
      () => {
        handleLocationError(true, infoWindow, map.getCenter());
      }
    );
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
});


function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

window.initMap = initMap;

