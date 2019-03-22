import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

export default function CompleteTask(params) {
 let task = _.find(params.tasks, function(task) { return task.id == params.id; });
 let users = _.map(params.users, (uu) => <option key={uu.id} value={uu.id}>{uu.name}</option>);

 function complete(ev) {
    let time = document.querySelector("#time").value;
    let status = document.querySelector("#status").value;
    let task = {id: params.id, status: status, time: time };
    api.update_task(task);
  }

  return (
    <div className="p-3">
      <h2>Complete Task</h2>
        <FormGroup className="w-50">
          <Label for="status">Status</Label>
          <Input type="text" name="status" id="status" />
        </FormGroup>
        <FormGroup className="w-50">
          <Label for="time_spent">Time Spent</Label>
          <Input type="number" name="time" id="time" step="15"></Input>
        </FormGroup>
        <Button onClick={ complete }>Complete</Button>
  </div>
  );
}
