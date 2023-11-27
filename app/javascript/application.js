import 'bootstrap';
import "@popperjs/core";
import "@hotwired/turbo-rails"

// Import your custom confetti module (if it exists)
import "./confetti";

import React from "react";
import ReactDOM from "react-dom/client";
// import App from './components/App';

import TicketsIndex from './components/Tickets/TicketsIndex';
import EmployeesTable from './components/Employees/EmployeesTable';

document.addEventListener('turbo:load', () => {
  // Mount TicketsIndex if we find an element with 'tickets-index'
  const ticketsElement = document.getElementById('tickets-index');
  if (ticketsElement) {
    ReactDOM.createRoot(ticketsElement).render(<TicketsIndex />);
  }

  // Mount EmployeesTable if we find an element with 'employees-table'
  const employeesElement = document.getElementById('employees-table');
  if (employeesElement) {
    ReactDOM.createRoot(employeesElement).render(<EmployeesTable />);
  }

  // Add similar code for other components as needed
});
