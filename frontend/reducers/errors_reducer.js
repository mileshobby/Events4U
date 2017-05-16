import { RECEIVE_AUTH_ERRORS, RECEIVE_LOGOUT_ERRORS } from '../actions/error_actions';
import merge from 'lodash/merge';

const noErrors = {authErrors: [], logoutErrors: []};

const ErrorsReducer = (state = noErrors, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_AUTH_ERRORS:
      return merge(noErrors, {authErrors: action.errors});
    case RECEIVE_LOGOUT_ERRORS:
      return merge(noErrors, {logoutErrors: action.errors});
    default:
      return state;
  }
};

export default ErrorsReducer;
