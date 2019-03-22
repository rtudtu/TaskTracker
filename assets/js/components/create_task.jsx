import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

function CreateTask(params) {

  function update(ev) {
   let tgt = $(ev.target);

   let data = {};
   data[tgt.attr('name')] = tgt.val();
   let action = {
     type: 'UPDATE_FORM',
     data: data,
   };
   params.dispatch(action);
 }

 function clear(ev) {
   params.dispatch({
     type: 'CLEAR_FORM',
   });
 }

  function submit(ev) {
    api.submit_task(params.form);
    clear(ev);
  }

  let user;
  let option;

  if(params.token) {
    user = _.find(params.users, function(user) { return user.id == params.token.user_id; });
  }

  if (user) {
    option = <option key={user.id} value={user.id}>{user.name}</option>;
  } else {
    option = <option></option>
  }

  return <div>
    <h2>New Task</h2>
    <FormGroup>
      <Label for="user_id">User</Label>
      <Input type="select" name="user_id" value={params.form.id} onChange={update}>
        <option key="" value=""></option>
        { option }
      </Input>
    </FormGroup>
    <FormGroup>
      <Label for="name">Name</Label>
      <Input type="text" name="name" value={params.form.name} onChange={update} />
    </FormGroup>
    <FormGroup>
      <Label for="desc">Desc</Label>
      <Input type="textarea" name="desc" value={params.form.desc} onChange={update} />
    </FormGroup>
    <FormGroup>
      <Label for="status">Status</Label>
      <Input type="text" name="status" value={params.form.status} onChange={update} />
    </FormGroup>
    <Button onClick={ submit }>Post</Button>
  </div>;
}


function state2params(state) {
  return {
    form: state.form,
    users: state.users,
    token: state.token,
  };
}

export default connect(state2params)(CreateTask);
