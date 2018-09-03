

function initMap() {
  const mapElement = document.getElementById('mapid');
  if(mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers);

    var mymap = L.map('mapid').setView([markers.lat, markers.lng], 13);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 25,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoibWF0ZW9kZGIiLCJhIjoiY2psaHYyYmt6MWhqejNwbmoyM2FpZ2U1bCJ9.f3u6KplzJtqa26utv-hwRw'
    }).addTo(mymap);

    var marker = L.marker([markers.lat, markers.lng]).addTo(mymap);
  }
}

export {initMap};

