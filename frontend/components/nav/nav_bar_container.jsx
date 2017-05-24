import { connect } from 'react-redux';
import NavBar from './nav_bar';
import { logout, login } from '../../actions/user_actions';
import { clearErrors } from '../../actions/error_actions';
import { fetchMatchingEvents } from '../../actions/event_actions';

const mapStateToProps = state => ({
  currentUser: state.currentUser
});

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout()),
  login: (user)=> dispatch(login(user)),
  clearErrors: () => dispatch(clearErrors()),
  fetchMatchingEvents: (searchString) => dispatch(fetchMatchingEvents(searchString))
});

export default connect(mapStateToProps, mapDispatchToProps)(NavBar);
