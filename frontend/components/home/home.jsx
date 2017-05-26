import React from 'react';
import EventSliderContainer from '../events/index_event/event_slider_container';
import { Link } from 'react-router-dom';
import EventSearchContainer from './category_search/category_search_container';
import RecommendedEventsContainer from '../events/recommended_events/recommended_events_container';

class Home extends React.Component{

  constructor(props){
    super(props);
  }

  render(){
    return(
      <div id="home">
        <div id='main-home-img-container'>
          <img
            src="http://res.cloudinary.com/events4u/image/upload/v1495089580/color_splash_copy_qli1my.jpg"
            id="main-home-img">
          </img>
          <div id="main-home-img-title">
              <span className="main-title">
                Find Your Next Experience
              </span>
              <span className="sub-title">
                Buy & Sell Tickets for Bay Area Events
              </span>
          </div>
        </div>
        <section id='event-slider-container'>
          <h1 className='trending-events-title'>
            Trending Events
          </h1>

          <EventSliderContainer />

          <section>
            <RecommendedEventsContainer />
          </section>

          <div className="see-more-button-container">
            <Link to="/browse-events/All" className='see-more-button'>
              See All Events
            </Link>
          </div>
        </section>


        <h1 id="events-by-category">Browse By Top Category</h1>
        <EventSearchContainer />

      </div>
    );
  }

}

export default Home;
