import React from 'react';
import TicketsIndex from './Tickets/TicketsIndex';
import EmployeesTable from './Employees/EmployeesTable';

const App = () => {
  return (
    <div>
      <div id="tickets-index">
        <TicketsIndex />
      </div>
      <div id="employees-table">
        <EmployeesTable /> {/* Assume you have this component */}
      </div>
      {/* Add other components if needed */}
    </div>
  );
};

export default App;
