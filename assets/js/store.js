import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';

function replace(state, item) {
  let s = state.slice();
  for (let task in state) {
    console.log("id:", item.id);
    console.log(state[task].id);
    if (item.id == state[task].id) {
      s[task] = item;
      console.log("replaced");
    }
  }
  return s;
}

function tasks(state = [], action) {
  switch (action.type) {
    case 'TASKS_LIST':
      return [...action.task];
    case 'ADD_TASK':
      return [...state, action.task];
    case 'UPDATE_TASK':
      return replace(state, action.task);
    default:
      return state;
  }
}

function users(state = [], action) {
  switch (action.type) {
  case 'USERS_LIST':
    return [...action.users];
    case 'ADD_USER':
    return [action.user, ...state];
    default:
      return state;
  }
}

const empty_form = {
  user_id: "",
  title: "",
  body: ""
};

function form(state = empty_form, action) {
  switch (action.type) {
    case 'UPDATE_FORM':
      return Object.assign({}, state, action.data);
    case 'CLEAR_FORM':
      return empty_form;
    default:
      return state;
  }
}

function token(state = null, action) {
  switch (action.type) {
    case 'SET_TOKEN':
      return action.token;
    default:
      return state;
  }
}

const empty_login = {
  email: "",
  pass: "",
};


function login(state = empty_login, action) {
  switch (action.type) {
    case 'UPDATE_LOGIN_FORM':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

function root_reducer(state0, action) {

  let reducer = combineReducers({tasks, users, form, token, login});
  let state1 = reducer(state0, action);

  return deepFreeze(state1);
};

let store = createStore(root_reducer);
export default store;
