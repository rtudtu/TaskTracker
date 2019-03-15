import React from 'react';
import { NavLink } from 'react-router-dom';
import { Form, FormGroup, NavItem, Input, Button } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

let LoginForm = connect(({login}) => {return {login};})((props) => {
  function update(ev) {
    let tgt = $(ev.target);
    let data = {};
    data[tgt.attr('name')] = tgt.val();
    props.dispatch({
      type: 'UPDATE_LOGIN_FORM',
      data: data,
    });
  }

  function create_token(ev) {
    api.submit_login(props.login);
  }

  function delete_token(ev) {
    // api.submit_logout(props.login);
    window.location.reload();
    console.log("log out");
  }

  return <div className="navbar-text">
    <Form inline>
      <FormGroup className="m-1">
        <Input type="text" name="email" placeholder="email"
                onChange={update} />
      </FormGroup>
      <FormGroup>
        <Input type="password" name="pass" placeholder="password"
                onChange={update} />
      </FormGroup>
      <Button className="btn btn-pimary m-1" onClick={create_token}>Log In</Button>
      <NavLink to="/register" exact={true} activeClassName="active" className="nav-link">Register</NavLink>
    </Form>
  </div>;
});

let Session = connect(({token}) => {return {token};})((props) => {

    function delete_token(ev) {
      // api.submit_logout(props.login);
      console.log("log out");
    }

  return <div className="navbar-text">
    <span className="mx-3">User: {props.token.user_id}</span>
    <Button className="btn btn-danger d-inline" onClick={delete_token}>Log Out</Button>
  </div>;
});

function Nav(props) {
  let session_info;
  let create_task;

  if (props.token) {
    session_info = <Session token={props.token} />;
    create_task =
        <NavItem>
          <NavLink to="/newTask" href="#" className="nav-link">Create Task</NavLink>
        </NavItem>
  }
  else {
    session_info = <LoginForm />
  }

  return (
    <nav className="navbar navbar-dark bg-dark navbar-expand">
      <span className="navbar-brand">
        TaskTracker
      </span>
      <ul className="navbar-nav mr-auto">
        <NavItem>
          <NavLink to="/" exact={true} activeClassName="active" className="nav-link">Tasks</NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/users" href="#" className="nav-link">Users</NavLink>
        </NavItem>
        { create_task }

      </ul>
        { session_info  }
    </nav>
  );
}

function state2props(state) {
  return {
    token: state.token,
  };
}

export default connect(state2props)(Nav);
