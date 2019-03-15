import React from 'react';
import { Card, CardText, CardBody,
  CardTitle, CardSubtitle, Button } from 'reactstrap';
import { Link } from 'react-router-dom';


function Task(params) {
  let assign_button = null;

  if (params.token) {
    assign_button = <button>assign</button>;
  }

  return (
   <div>
     <Card>
       <CardBody>
         <CardTitle>Title: {params.task.title}</CardTitle>
         <CardSubtitle>Id: {params.task.id}</CardSubtitle>
         <CardText>Description: {params.task.body}</CardText>
         {assign_button}
       </CardBody>
     </Card>
   </div>
 );
}

export default function Tasks(params) {
  let tasks = _.map(params.tasks, (uu) => <Task key={uu.id} task={uu} token={params.store.token} />);
  return <div>
    { tasks }
  </div>;
}
