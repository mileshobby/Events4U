import React from 'react';
import SessionFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';
import GreetingContainer from './auth/greeting_container';
import { AuthRoute } from '../util/route_util';
import NavBarContainer from './nav/nav_bar_container';

const App = () => (
  <div>
    <header>
      <NavBarContainer />
    </header>
      <AuthRoute path="/login" component={SessionFormContainer} />
      <AuthRoute path="/signup" component={SessionFormContainer} />
      <div id='main-img-container'></div>
  </div>
);

export default App;
