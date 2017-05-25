import React from 'react';
import BrowseEventsItem from './browse_events_item';
import FilterContainer from './filter/filter_container';
import { Route } from 'react-router';
import EventMap from '../map/event_map';

class BrowseEvents extends React.Component{
  constructor(props){
    super(props);
  }

  componentDidMount(){
    window.scrollTo(0,0);
    const category = this.props.match.params.category;
    let searchString = this.props.match.params.searchString;
    if(category === "Search" && !searchString){
      this.props.fetchAllEvents();
    }
  }

  render(){
    const category = this.props.match.params.category;
    let search = (this.props.match.params.searchString ? true : false);
    let events = this.props.events.map((event,i)=> (
      <BrowseEventsItem event={event} key={`${event.name}-${event.id}-${i}`}
        bookmarkEvent={this.props.bookmarkEvent}
        unBookmarkEvent={this.props.unBookmarkEvent}
        loggedIn={this.props.loggedIn}
        />
    ));

    let resultsText;
    if (events.length === 0){
      resultsText = <div className="search-results-text">Sorry! We could not find any events matching "{this.props.match.params.searchString}". We are still
                    a growing web service with a limited number of events. Try some popular searches, like...
                    <strong>concert</strong>, <strong>festival</strong>, or <strong>game</strong>! </div>;
    }
    else if(search){
      resultsText = <div className="search-results-text">Showing Search Results for: "{this.props.match.params.searchString}"</div>;
    }
    else{
      resultsText = <div className="search-results-text">Showing All Events for: {category}</div>;
    }
    return(
      <div id="browse-events-container">
        <div id="filter-box-container">
          <div className="google-map-box">
            <EventMap events={this.props.events}/>
          </div>
          <Route path="/browse-events/:category/:searchString?" render={()=>
              <FilterContainer category={category} search={search}/> } />
        </div>
        <ul className="browse-events-list">
          <h1>Explore Events</h1>
          {resultsText}
          {events}
        </ul>
      </div>
    );
  }
}


export default BrowseEvents;
