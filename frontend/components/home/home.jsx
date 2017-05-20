import React from 'react';
import EventSliderContainer from '../events/index_event/event_slider_container';
import { Link } from 'react-router-dom';
import EventSearchContainer from './category_search/category_search_container';

class Home extends React.Component{

  constructor(props){
    super(props);
  }

  render(){
    return(
      <div id="home">
        <img
          src="http://res.cloudinary.com/events4u/image/upload/v1495089580/color_splash_copy_qli1my.jpg"
          id="main-home-img">
        </img>
        <section id='event-slider-container'>
        <h1 className='trending-events-title'>
          Trending Events4U
        </h1>

        <EventSliderContainer />
        <div className="see-more-button-container">
          <Link to="/browse-events" className='see-more-button'>
            See More Events
          </Link>
        </div>
        </section>

        <EventSearchContainer />

      </div>
    );
  }

}

export default Home;
