import React from 'react';
import { withRouter } from 'react-router-dom';

class Filter extends React.Component{
  constructor(props){
    super(props);
    this.dynamicSelector = this.dynamicSelector.bind(this);
    this.filterEvents = this.filterEvents.bind(this);
    this.unFilterEvents = this.unFilterEvents.bind(this);
  }

  filterEvents(category){
    return (e) => {
      this.props.clearEvents();
      this.props.fetchFilteredEvents({category_names: [category]});
      this.props.history.push(`/browse-events/${category}`);
      document.getElementById("load-button").disabled = false;
    };
  }

  dynamicSelector(int){
    if(this.props.location.pathname === '/browse-events/All' && int === 1){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Sports' && int === 2){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Arts' && int === 3){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Music' && int === 4){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Food & Drink' && int === 5){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Parties' && int === 6){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Classes' && int === 7){
      return " selected";
    }
    else if(this.props.location.pathname === '/browse-events/Business' && int === 8){
      return " selected";
    }
    else{
      return "";
    }
  }

  componentWillUnmount(){
    this.props.clearEvents();
  }

  unFilterEvents(e){
    this.props.clearEvents();
    this.props.fetchSomeEvents(this.props.offset);
    this.props.history.push(`/browse-events/All`);
    document.getElementById("load-button").disabled = false;
  }

  componentDidMount(){
    let category = this.props.category;
    document.getElementById("load-button").disabled = false;
    if(category === 'All'){
      this.props.clearEvents();
      this.props.fetchSomeEvents(this.props.offset);
    }
    else if(category === 'Search'){
      // let searchString = this.props.match.params.searchString;
      // this.props.fetchMatchingEvents(searchString);
      return;
    }
    else{
      this.props.clearEvents();
      this.props.fetchFilteredEvents({category_names: [category]});
    }
  }

  // componentWillReceiveProps(nextProps){
  //   if(this.props.search){
  //     let category = nextProps.category;
  //     if(category === 'All'){
  //       nextProps.fetchSomeEvents();
  //     }
  //     else if(category === 'all'){
  //       let searchString = nextProps.match.params.searchString;
  //       nextProps.fetchMatchingEvents(searchString);
  //     }
  //     else{
  //       nextProps.fetchFilteredEvents({category_names: [category]});
  //     }
  //   }
  // }

  render(){
    return (
      <div className="filters">
          <h2>Filter By Category</h2>
          <ul className="categories-filter-list">
            <li
              onClick={this.unFilterEvents}
              className={"filter-category" + this.dynamicSelector(1)}>
              All Categories</li>
            <li
              onClick={this.filterEvents("Sports")}
              className={"filter-category" + this.dynamicSelector(2)}>
              Sports</li>
            <li
              onClick={this.filterEvents("Arts")}
              className={"filter-category" + this.dynamicSelector(3)}>
              Arts</li>
            <li
              onClick={this.filterEvents("Music")}
              className={"filter-category" + this.dynamicSelector(4)}>Music</li>
            <li
              onClick={this.filterEvents("Food & Drink")}
              className={"filter-category" + this.dynamicSelector(5)}>
              Food & Drink</li>
            <li
              onClick={this.filterEvents("Parties")}
              className={"filter-category" + this.dynamicSelector(6)}>
              Parties</li>
            <li
              onClick={this.filterEvents("Classes")}
              className={"filter-category" + this.dynamicSelector(7)}>
              Classes</li>
            <li
              onClick={this.filterEvents("Business")}
              className={"filter-category" + this.dynamicSelector(8)}>
              Business</li>
          </ul>
      </div>
    );
  }

}

export default withRouter(Filter);
