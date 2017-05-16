import { connect } from 'react-redux';
import AuthForm from './auth_form';
import {login, signup} from '../../actions/user_actions';
import {clearErrors} from '../../actions/error_actions';

const mapStateToProps = (state, ownProps) => {
  return {
    loggedIn: Boolean(state.currentUser),
    errors: state.errors,
    formType: ownProps.type
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    login: user => dispatch(login(user)),
    signup: user => dispatch(signup(user)),
    clearErrors: () => dispatch(clearErrors())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(AuthForm);
