/* global google:false */

class MarkerManager {
  constructor(map, handleClick){
    this.map = map;
    this.handleClick = handleClick;
    this.markers = {};
  }

  updateMarkers(events){
    const eventsObj = {};
    events.forEach(event => eventsObj[event.id] = event);

    events
      .filter(event => !this.markers[event.id])
      .forEach(newEvent => this.createMarkerFromEvent(newEvent, this.handleClick));

    Object.keys(this.markers)
      .filter(eventId => !eventsObj[eventId])
      .forEach((eventId) => this.removeMarker(this.markers[eventId]));
  }

  createMarkerFromEvent(event) {
    $.ajax({
      method: "get",
      url: `https:maps.googleapis.com/maps/api/geocode/json?address=${event.street_address} ${event.city_state_zip}&key=AIzaSyCtYkQS2hgXAjcyG_ViIRrPlF7rVSqdsos`
    })
    .then(data => {
      const lat = data.results[0].geometry.location.lat;
      const lng = data.results[0].geometry.location.lng;
      const position = new google.maps.LatLng(lat, lng);
      const marker = new google.maps.Marker({
        position,
        map: this.map,
        eventId: event.id
      });
      marker.addListener('click', () => this.handleClick(event));
      this.markers[marker.eventId] = marker;
    });

  }

  removeMarker(marker) {
    this.markers[marker.eventId].setMap(null);
    delete this.markers[marker.eventId];
  }
}

export default MarkerManager;
