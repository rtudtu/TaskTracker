import React from 'react';
import { connect } from 'react-redux';
import { Button, Form, FormGroup, Label, Input, FormText } from 'reactstrap';
import api from '../api';

export default function RegisterUser(params) {

  function register(ev) {
    ev.preventDefault();
    let email = document.querySelector("#reg-email").value;
    let name = document.querySelector("#reg-name").value;
    let password = document.querySelector("#reg-pass").value;
    let password_confirm = document.querySelector("#reg-pass-confirm").value;

    let user = { email: email, name: name, password: password, password_confirmation: password_confirm };
    api.register_user(user);

  }

  return (
    <Form className="w-50 mx-auto mt-5" onSubmit={register}>
      <h2>Register</h2>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="text" name="email" id="reg-email"/>
      </FormGroup>
      <FormGroup>
        <Label for="name">Name</Label>
        <Input type="text" name="name" id="reg-name" />
      </FormGroup>
      <FormGroup>
        <Label for="password">Passsword</Label>
        <Input type="password" name="password" id="reg-pass" />
      </FormGroup>
      <FormGroup>
        <Label for="password_confirm">Confirm Password</Label>
        <Input type="password" name="password_confirm" id="reg-pass-confirm"/>
      </FormGroup>
      <input type="submit" value="Submit" className="btn btn-secondary" />
    </Form>
  );
}
