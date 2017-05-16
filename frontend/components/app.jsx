import React from 'react';
import AuthFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';
import GreetingContainer from './auth/greeting_container';
import { AuthRoute } from '../util/route_util';
import NavBarContainer from './nav/nav_bar_container';

const App = () => (
  <div>
    <header>
      <NavBarContainer />
    </header>

  </div>
);

export default App;
