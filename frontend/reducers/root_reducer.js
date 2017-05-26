import { combineReducers } from 'redux';
import UsersReducer from './users_reducer';
import ErrorsReducer from './errors_reducer';
import EventsReducer from './events_reducer';
import EventDetailsReducer from './event_details_reducer';
import CategoryReducer from './category_reducer';
import RecommendedEventsReducer from './recommended_events_reducer';
import AutoCompleteResultsReducer from './autocomplete_results_reducer';


const rootReducer = combineReducers({
  currentUser: UsersReducer,
  errors: ErrorsReducer,
  events: EventsReducer,
  eventDetails: EventDetailsReducer,
  categories: CategoryReducer,
  recommendedEvents: RecommendedEventsReducer,
  autoCompleteResults: AutoCompleteResultsReducer
});

export default rootReducer;
