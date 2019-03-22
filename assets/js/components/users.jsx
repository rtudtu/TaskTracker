import React from 'react';
import { NavLink } from 'react-router-dom';
import { Card, CardText, CardBody,
  CardTitle, CardSubtitle, Button } from 'reactstrap';
import { Link } from 'react-router-dom';

function User(params) {
  return(
    <div>
      <Card className="container">
        <CardBody>
          <CardTitle>Name: {params.user.name}</CardTitle>
          <CardText>Email: {params.user.email}</CardText>
          <CardText>Id: {params.user.id}</CardText>
        </CardBody>
      </Card>
    </div>
  );
}

export default function Users(params) {
  let users = _.map(params.users, (uu) => <User key={uu.id} user={uu} />);
  return <div>
    { users }
  </div>;
}
