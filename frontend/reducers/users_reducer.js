import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/user_actions';

const nullUser = null;

const UsersReducer = (state = nullUser, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_CURRENT_USER:
      return action.currentUser;
    default:
      return state;
  }
};

export default UsersReducer;
