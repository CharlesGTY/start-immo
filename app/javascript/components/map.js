function initMap() {
  const mapElement = document.getElementById('mapid');
  if(mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers);

    var mymap = L.map('mapid').setView([markers[0].lat, markers[0].lng], 11);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 25,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoibWF0ZW9kZGIiLCJhIjoiY2psaHYyYmt6MWhqejNwbmoyM2FpZ2U1bCJ9.f3u6KplzJtqa26utv-hwRw'
    }).addTo(mymap);

    markers.forEach(marker => {
      var mapMarker = L.marker([marker.lat, marker.lng]).addTo(mymap);
      mapMarker._icon.id = "icon-" + marker.id;
      mapMarker._icon.src = "https://image.flaticon.com/icons/svg/727/727590.svg";
    })

    const messages = document.querySelectorAll('.message')
    messages.forEach((message) => {
      message.addEventListener('mouseenter', () => {
        const iconMap = document.getElementById(`icon-${message.dataset.houseId}`);
        iconMap.src = 'https://image.flaticon.com/icons/svg/787/787535.svg'
      })
      message.addEventListener('mouseleave', () => {
        const iconMap = document.getElementById(`icon-${message.dataset.houseId}`);
        iconMap.src = 'https://image.flaticon.com/icons/svg/727/727590.svg'
      })
    })
  }
}

export {initMap};

