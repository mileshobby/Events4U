import React from 'react';
import MarkerManager from '../../../util/marker_manager';
import {values} from 'lodash';

class SingleEventMap extends React.Component{
  constructor(props){
    super(props);
  }

  componentWillReceiveProps() {
    let mapOptions = {
      center: { lat: 1, lng: 1},
      zoom: 10
    };
    this.map = new google.maps.Map(this.mapNode, mapOptions);
  }



  render(){
    return(
      <div id="single-map-container" ref={ map1 => this.mapNode = map1}>

      </div>
    );
  }
}

export default SingleEventMap;
