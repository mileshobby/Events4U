import React from 'react';
import AuthFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';
import GreetingContainer from './auth/greeting_container';
import { AuthRoute } from '../util/route_util';
import NavBarContainer from './nav/nav_bar_container';
import Home from './home/home';
import Footer from './footer/footer';
import EventDetailContainer from './events/event_detail_container';
import EventFormContainer from './events/event_form_container';
import BrowseEventsContainer from './events/browse_events/browse_events_container';
import UserEventsContainer from './events/user_events/user_events_container';
import UserEvents from './events/user_events/user_events_container';
import { Switch } from 'react-router';

const App = () => (
  <div id='app'>
    <div id="main-content">
      <header>
        <NavBarContainer />
      </header>
      <Route exact path="/" component={Home} />
      <AuthRoute exact path="/events/:eventId" component={EventDetailContainer} />
      <Route exact path="/new-event" component={EventFormContainer} />
      <Route path="/browse-events/:category" component={ BrowseEventsContainer } />
      <Route path="/user-events" component={ UserEventsContainer } />
    </div>
    <footer id='main-footer-container'>
      <Footer />
    </footer>
  </div>
);

export default App;
