import React from "react";

const TicketCard = ({ ticket }) => {
  return (
    <div className="card">
      <div className="card-body">
        <h5 className="card-title">{ticket.title}</h5>
        <p className="card-text">{ticket.description}</p>
        <p className="card-text">
          <small className="text-muted">{ticket.status}</small>
        </p>
      </div>
    </div>
  );
};

export default TicketCard;
