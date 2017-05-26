import {RECEIVE_AUTOCOMPLETE_RESULTS, CLEAR_AUTOCOMPLETE_RESULTS} from '../actions/event_actions';

const AutoCompleteResultsReducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_AUTOCOMPLETE_RESULTS:
      return action.results;
    case CLEAR_AUTOCOMPLETE_RESULTS:
      return [];
    default:
      return state;
  }
};

export default AutoCompleteResultsReducer;
