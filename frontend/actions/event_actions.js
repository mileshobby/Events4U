import * as APIUtil from '../util/event_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_EVENT = "RECEIVE_EVENT";
export const RECEIVE_EVENT_DETAILS = "RECEIVE_EVENT_DETAILS";
export const RECEIVE_EVENTS = "RECEIVE_EVENTS";
export const DESTROY_EVENT = "DESTROY_EVENT";

export const receiveNewEvent = event => ({
  type: RECEIVE_EVENT,
  event
});

export const receiveEventDetails = event => ({
  type: RECEIVE_EVENT_DETAILS,
  event
});

export const receiveEvents = events => ({
  type: RECEIVE_EVENTS,
  events
});

export const destroyEvent = id => ({
  type: DESTROY_EVENT,
  id
});

export const fetchAllEvents = () => dispatch => {
  return APIUtil.getEvents()
    .then((events) => dispatch(receiveEvents(events)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)));
};

export const fetchEventDetails = (id) => dispatch => {
  return APIUtil.getEvent(id)
    .then(event => dispatch(receiveEventDetails(event)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)));
};

export const deleteEvent = (id) => dispatch => {
  return APIUtil.deleteEvent(id)
    .then(() => dispatch(destroyEvent(id)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)));
};

export const updateEvent = (event1) => dispatch => {
  return APIUtil.updateEvent(event1)
    .then((event2) => dispatch(receiveNewEvent(event2)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)));
};

export const createEvent = (event1) => dispatch => {
  return APIUtil.createEvent(event1)
    .then((event2) => dispatch(receiveNewEvent(event2)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)));
};

export const fetchFilteredEvents = (filters) => dispatch => {
  return APIUtil.getFilteredEvents(filters)
    .then((events) => dispatch(receiveEvents(events)));
};
