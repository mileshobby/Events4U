import * as APIUtil from '../util/session_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const login = (user1) => (dispatch) => {
  return APIUtil.login(user1)
    .then(user2 => dispatch(receiveCurrentUser(user2)))
    .fail( err=> dispatch(receiveErrors(err.responseJSON)));
};

export const logout = () => dispatch => (
  APIUtil.logout()
    .then(()=>dispatch(receiveCurrentUser(null)))
    .fail( err => dispatch(receiveErrors(err.responseJSON)))
);

export const signup = (user1) => dispatch => (
  APIUtil.signup(user1)
    .then(user2 => {
      dispatch(receiveCurrentUser(user2));})
    .fail( err =>
      dispatch(receiveErrors(err.responseJSON)))
);
