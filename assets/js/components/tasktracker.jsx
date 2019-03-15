import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Nav from './nav';
import CreateTask from './create-task';
import RegisterUser from './create-user';
import Users from './users';
import Tasks from './tasks';
import $ from 'jquery';

export default function tasktracker_init(store) {
  ReactDOM.render(
  <Provider store={store}>
    <Tasktracker state={store.getState()} />
  </Provider>,
  document.getElementById('root')
  );
}

let Tasktracker = connect((state) => state)((props) => {
  return (
    <Router>
      <div className="panel panel-default">
        <Nav />
        <Route path="/" exact={true} render={() =>
          <Tasks tasks={props.tasks} store={props}/>
        } />
        <Route path="/register" exact={true} render={() =>
          <div>
            <RegisterUser />
          </div>
        } />
        <Route path="/users" exact={true} render={() =>
            <Users users={props.users} />
        } />
        <Route path="/newTask" exact={true} render={() =>
            <CreateTask users={props.users} token={props.store} />
        } />
      </div>
    </Router>
  );
});
