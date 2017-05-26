import { connect } from 'react-redux';
import { clearRecommendedEvents, fetchRecommendedEvents, bookmarkEvent,
          unBookmarkEvent} from '../../../actions/event_actions';
import RecommendedEvents from './recommended_events';
import { allRecommendedEvents } from '../../../reducers/selectors';

const mapStateToProps = (state) => ({
  recommendedEvents: allRecommendedEvents(state),
  loggedIn: Boolean(state.currentUser)
});

const mapDispatchToProps = (dispatch) => ({
  clearRecommendedEvents: () => dispatch(clearRecommendedEvents()),
  fetchRecommendedEvents: () => dispatch(fetchRecommendedEvents()),
  bookmarkEvent: (eventId) => dispatch(bookmarkEvent(eventId)),
  unBookmarkEvent: (eventId) => dispatch(unBookmarkEvent(eventId))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecommendedEvents);
