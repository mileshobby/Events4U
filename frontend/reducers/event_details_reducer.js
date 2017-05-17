import { RECEIVE_EVENT_DETAILS, DESTROY_EVENT, RECEIVE_NEW_EVENT }
  from '../actions/event_actions';

const EventDetailsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_EVENT_DETAILS:
      return action.event;
    case RECEIVE_NEW_EVENT:
      return action.event;
    case DESTROY_EVENT:
      return {};
    default:
      return state;
  }
};

export default EventDetailsReducer;
