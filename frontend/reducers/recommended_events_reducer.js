import { RECEIVE_RECOMMENDED_EVENTS, CLEAR_RECOMMENDED_EVENTS, ADD_BOOKMARK_TO_EVENT,
         REMOVE_BOOKMARK_FROM_EVENT}
  from '../actions/event_actions';
import merge from 'lodash/merge';

const RecommendedEventsReducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_RECOMMENDED_EVENTS:
      return action.events;
    case CLEAR_RECOMMENDED_EVENTS:
      return [];
    case ADD_BOOKMARK_TO_EVENT:
      let event = state[action.id];
      if(!event){
        return state;
      }
      event.bookmarked = true;
      return merge({}, state, {[event.id]: event});
    case REMOVE_BOOKMARK_FROM_EVENT:
      event = state[action.id];
      if(!event){
        return state;
      }
      event.bookmarked = false;
      return merge({}, state, {[event.id]: event});
    default:
      return state;

  }
};

export default RecommendedEventsReducer;
