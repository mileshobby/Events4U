import React from 'react';
import MarkerManager from '../../../util/marker_manager';
import values from 'lodash/values';

class SingleEventMap extends React.Component{
  constructor(props){
    super(props);
    this.loaded = false;
  }

  componentWillReceiveProps(nextProps) {
    if(!nextProps.event) return;
    if(this.loaded) return;
    let {title, street_address, city_state_zip} = nextProps.event;
    $.ajax({
      method: "get",
      url: `https://maps.googleapis.com/maps/api/geocode/json?address=${street_address} ${city_state_zip}&key=${window.maps_key}`,
      crossDomain: true
    })
    .then(data => {
      const lat = data.results[0].geometry.location.lat;
      const lng = data.results[0].geometry.location.lng;
      const position = new google.maps.LatLng(lat, lng);
      const marker = new google.maps.Marker({
        position,
        map: this.map,
        eventId: event.id,
        label: "B"
      });
      let infowindow = new google.maps.InfoWindow({
        content: title,
        disableAutoPan: true
      });
      marker.addListener('click', () => infowindow.open(this.map, marker));
      this.map.setCenter({lat: lat, lng: lng});
      window.scrollTo(0,0);
      $(document.body).css({'cursor' : 'wait'});
      setTimeout(()=>{
        $(document.body).css({'cursor' : 'default'});
        this.loaded = true;
      }, 5000);
      navigator.geolocation.getCurrentPosition( (startPos) => {
        const originLat = startPos.coords.latitude;
        const originLng = startPos.coords.longitude;
        const originPos = new google.maps.LatLng(originLat, originLng);
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        directionsDisplay.setMap(this.map);
        directionsService.route({
          origin: originPos,
          destination: position,
          travelMode: 'DRIVING'
        }, (response, status) => {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
        $(document.body).css({'cursor' : 'default'});
        this.loaded = true;
      });
    });
  }

  componentDidMount(){
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435 }, // this is SF
      zoom: 15
    };
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    //fix for last minute bug...refactor this!!!
    this.componentWillReceiveProps(this.props);
  }



  render(){
    return(
      <div id="single-map-container" ref={map1 => this.mapNode = map1}>
      </div>
    );
  }
}

export default SingleEventMap;
