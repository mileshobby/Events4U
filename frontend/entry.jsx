import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import Modal from 'react-modal';
import { fetchAllEvents, fetchEvent, deleteEvent} from './actions/event_actions';

document.addEventListener('DOMContentLoaded',()=>{
  let store;
  if(window.currentUser){
    const preloadedState = { currentUser: window.currentUser };
    store = configureStore(preloadedState);
    delete window.currentUser;
  }
  else{
    store = configureStore();
  }
  Modal.setAppElement('body');
  window.store = store; //REMOVE THIS
  const content = document.getElementById('content');
  ReactDOM.render( <Root store={store} />, content);
});
