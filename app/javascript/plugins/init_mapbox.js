import mapboxgl from 'mapbox-gl';

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    if (mapElement) {
    // [ ... ]
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    }
  }
};

const initMapbox2 = () => {
  const mapElement2 = document.getElementById('map2');

  if (mapElement2) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
    const map2 = new mapboxgl.Map({
      container: 'map2',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    if (mapElement2) {
    // [ ... ]
    const markers = JSON.parse(mapElement2.dataset.markers);
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map2);
    });
    fitMapToMarkers(map2, markers);
    addMarkersToMap(map2, markers);
    }
  }
};

export { initMapbox };
export { initMapbox2 };

