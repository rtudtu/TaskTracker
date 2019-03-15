import React from 'react';
import { Link } from 'react-router-dom';

function User(params) {
  return(
    <div>
      <p>User Id: {params.user.id}</p>
      <p>User Email: {params.user.email}</p>
      <p>User Name: {params.user.name}</p>
    </div>
  );
}

export default function Users(params) {
  let users = _.map(params.users, (uu) => <User key={uu.id} user={uu} />);
  return <div>
    { users }
  </div>;
}
