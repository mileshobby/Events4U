import React from "react";
import { Link } from 'react-router-dom';
import AuthModal from '../modal/auth_modal';

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
          <div>
          {this.props.currentUser.username}  &nbsp;
          <i className="fa fa-angle-double-down" aria-hidden="true"></i>
          </div>
          <ul className="dropdown-content">
            <li>
              Saved Events
            </li>
            <li>
              Tickets
            </li>
            <li>
              Hosted Events
            </li>
            <button
              className="log-out-button"
              onClick={this.props.logout}>
              Log Out
            </button>
          </ul>
        </div>
        <li>Browse Events</li>
        <li>Create Event</li>
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
        <div className="logo"><Link to="/">Events4U</Link></div>
        {navLinks}
      </nav>
    );
  }

}

export default NavBar;