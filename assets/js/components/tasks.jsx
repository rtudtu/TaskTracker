import React from 'react';
import { NavLink } from 'react-router-dom';
import { Card, CardText, CardBody,
  CardTitle, CardSubtitle, Button } from 'reactstrap';
import { Link } from 'react-router-dom';

function Task(params) {
  console.log(params.task)
  let assign_button;
  let complete_button;
  let user = "";
  let bg = "";

  if (params.token) {
    if (params.token.user_id == params.task.user.id && params.task.status != "Complete") {
      let link = "/assign/" + params.task.id;
      assign_button = <NavLink to={link} exact={true} activeClassName="active" className="btn btn-primary w-10">Assign</NavLink>
    }
    if (params.token.user_id == params.task.user.id && params.task.status != "Complete") {
      let link = "/complete/" + params.task.id;
      complete_button = <NavLink to={link} exact={true} activeClassName="active" className="btn btn-primary w-10 btn-success m-1">Complete</NavLink>
    }
  }

  if (params.task.user) {
    user = params.task.user.name;
  }

  if (params.task.status == "Complete") {
    bg = "bg-success";
  } else {
    bg = "bg-warning";
  }

  return (
   <div>
     <Card className={bg}>
       <CardBody>
         <CardTitle>Name: {params.task.name}</CardTitle>
         <CardText>Assigned to: {user}</CardText>
         <CardText>Description: {params.task.desc}</CardText>
         <CardText>Status: {params.task.status}</CardText>
         <CardText>Time Spent: {params.task.time}</CardText>
         {assign_button}
         {complete_button}
       </CardBody>
     </Card>
   </div>
 );
}

export default function Tasks(params) {
  let tasks = _.map(params.tasks, (uu) => <Task key={uu.id} task={uu} token={params.store.token} />).reverse();
  return <div>
    { tasks }
  </div>;
}
