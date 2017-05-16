export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const RECEIVE_AUTH_ERRORS = 'RECEIVE_ERRORS';
export const RECEIVE_LOGOUT_ERRORS = 'RECEIVE_ERRORS';

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const receiveLogoutErrors = errors => ({
  type: RECEIVE_LOGOUT_ERRORS,
  errors
});

export const receiveAuthErrors = errors => ({
  type: RECEIVE_AUTH_ERRORS,
  errors
});
