import React from 'react';
import AuthFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';
import GreetingContainer from './auth/greeting_container';
import { AuthRoute } from '../util/route_util';
import NavBarContainer from './nav/nav_bar_container';
import Home from './home/home';
import Footer from './footer/footer';
import EventDetailContainer from './events/event_detail_container';

const App = () => (
  <div id='app'>
    <header>
      <NavBarContainer />
    </header>
    <Route exact path="/" component={Home} />
    <Route path="/events/:eventId" component={EventDetailContainer} />
    <Footer />
  </div>
);

export default App;
