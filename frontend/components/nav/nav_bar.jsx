import React from "react";
import { Link, withRouter } from 'react-router-dom';
import AuthModal from '../modal/auth_modal';
import SearchBarContainer from '../search/search_bar_container';

class NavBar extends React.Component{
  constructor(props){
    super(props);
    this.loggedInLinks = this.loggedInLinks.bind(this);
    this.signInAsGuest = this.signInAsGuest.bind(this);
  }

  loggedInLinks(){
    return(
      <ul className="navbar-links" id='logged-in-links'>
        <div className="dropdown">
          <Link to="/user-events">
            <div>
              {this.props.currentUser.username}&nbsp;
            <i className="fa fa-angle-double-down" aria-hidden="true"></i>
            </div>
          </Link>
          <ul className="dropdown-content">
            <Link to="/user-events/bookmarks">
              <li>
                Saved Events
              </li>
            </Link>
            <Link to="/user-events/tickets">
              <li>
                Tickets
              </li>
            </Link>
            <Link to="/user-events/hosted-events">
              <li>
                Hosted Events
              </li>
            </Link>
            <button
              className="log-out-button"
              onClick={this.props.logout}>
              Log Out
            </button>
          </ul>
        </div>
        <Link to="/browse-events/All"><li>Browse Events</li></Link>
        <Link to="/new-event"><li>Create Event</li></Link>
      </ul>
    );
  }

  signInAsGuest(){
    this.props.login({username: "GuestUser", password: "password"});
  }

  loggedOutLinks(){
    return(
      <ul className="navbar-links" id='logged-out-links'>
        <li onClick={this.signInAsGuest}>Demo</li>
        <li><AuthModal type="Log In" clearErrors={this.props.clearErrors}/></li>
        <li><AuthModal type="Sign Up" clearErrors={this.props.clearErrors}/></li>
      </ul>
    );
  }

  render(){
    const navLinks = (this.props.currentUser ?
                  this.loggedInLinks() : this.loggedOutLinks());
    return(
      <nav id='main-nav'>
        <div id='left-nav'>
          <div className="logo"><Link to="/">Events4U</Link></div>
          <SearchBarContainer fetchMatchingEvents={this.props.fetchMatchingEvents}/>
        </div>
        {navLinks}
      </nav>
    );
  }

}

export default withRouter(NavBar);
