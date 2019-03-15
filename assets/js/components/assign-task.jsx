import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

export default function AssignTask(params) {
 let task = _.find(params.tasks, function(task) { return task.id == params.id; });
 let users = _.map(params.users, (uu) => <option key={uu.id} value={uu.id}>{uu.name}</option>);

 function assign(ev) {
    let assignee_id = document.querySelector("#assignee_id").value;

    let task = {id: params.id, assignee_id: assignee_id };
    api.update_task(task);
  }

  return (
    <div className="p-3">
      <h2>Assign Task</h2>
        <FormGroup>
          <Label for="user_id">Assign to</Label>
          <Input type="select" name="user_id" id="assignee_id">
            <option key="" value=""></option>
            { users }
          </Input>

        </FormGroup>
        <Button onClick={ assign }>Assign</Button>
  </div>
  );
}