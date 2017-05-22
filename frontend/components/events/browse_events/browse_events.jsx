import React from 'react';
import BrowseEventsItem from './browse_events_item';
import FilterContainer from './filter/filter_container';
import { Route } from 'react-router';

class BrowseEvents extends React.Component{
  constructor(props){
    super(props);
  }

  // componentWillMount(){
  //   if(this.props.events.length === 0){
  //     this.props.fetchAllEvents(this.props.match.params.eventId);
  //   }
  // }

  componentDidMount(){
    window.scrollTo(0,0);
  }

  // componentWillReceiveProps(nextProps) {
  //   if (this.props.match.params.eventId !== nextProps.match.params.eventId) {
  //     this.props.fetchAllEvents(nextProps.match.params.eventId);
  //   }
  // }

  render(){
    const category = this.props.match.params.category;
    const events = this.props.events.map((event,i)=> (
      <BrowseEventsItem event={event} key={`${event.name}-${event.id}-${i}`}
        bookmarkEvent={this.props.bookmarkEvent}
        unBookmarkEvent={this.props.unBookmarkEvent}/>
  ));
    return(
      <div id="browse-events-container">
        <div id="filter-box-container">
          <h1>Filter</h1>
          <div>
            GOOGLE MAP
          </div>
          <FilterContainer category={category}/>
        </div>
        <ul className="browse-events-list">
          <h1>Explore Events</h1>
          {events}
        </ul>
      </div>
    );
  }
}


export default BrowseEvents;
