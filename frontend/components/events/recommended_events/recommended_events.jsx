import React from 'react';
import EventSliderItem from '../index_event/event_slider_item';

class RecommendedEvents extends React.Component{
  constructor(props){
    super(props);
  }

  componentDidMount(){
    if(this.props.loggedIn){
      this.props.fetchRecommendedEvents();
    }
    else{
      this.props.clearRecommendedEvents();
    }
  }

  componentWillReceiveProps(nextProps){
    if (nextProps.loggedIn === this.props.loggedIn) return;
    if(nextProps.loggedIn){
      this.props.fetchRecommendedEvents();
    }
    else{
      this.props.clearRecommendedEvents();
    }
  }

  render(){
    let events = this.props.recommendedEvents;
    let header;
    if(events.length > 0){
       events = events.map((event, i) => (
            <EventSliderItem
              event={event}
              loggedIn={this.props.loggedIn}
              key={`rec-${i}-${event.id}`}
              bookmarkEvent={this.props.bookmarkEvent}
              unBookmarkEvent={this.props.unBookmarkEvent} />
      ));
      header = <h2 id='recommended-events-title'>Recommended Events4U</h2>;
    }
    return(
      <div>
        {header}
        <div id='recommended-events'>
          {events}
        </div>
      </div>
    );
  }
}

export default RecommendedEvents;
