import React from 'react';
import SessionFormContainer from './auth/auth_form_container';
import { Route } from 'react-router';

const App = () => (
  <div>
    <h1>Events4U</h1>
      <Route path="/login" component={SessionFormContainer} />
      <Route path="/signup" component={SessionFormContainer} />
  </div>
);

export default App;
