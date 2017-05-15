import React from 'react';
import SessionFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';
import GreetingContainer from './auth/greeting_container';

const App = () => (
  <div>
    <header>
      <h1>Events4U</h1>
      <Route path="/" component={GreetingContainer} />
    </header>
      <Route path="/login" component={SessionFormContainer} />
      <Route path="/signup" component={SessionFormContainer} />
  </div>
);

export default App;
