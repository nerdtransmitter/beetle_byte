// TicketsTable.jsx
import React, { useState, useEffect } from 'react';

function TicketsTable({tickets}) {
  return (
    <div className="overflow-x-auto relative">
      <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" className="py-3 px-6">
              Ticket ID
            </th>
            <th scope="col" className="py-3 px-6">
              Title
            </th>
            <th scope="col" className="py-3 px-6">
              Status
            </th>
            <th scope="col" className="py-3 px-6">
              Assigned To
            </th>
            <th scope="col" className="py-3 px-6">
              Project
            </th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <tr key={ticket.id} className="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
              <td className="py-4 px-6">{ticket.id}</td>
              <td className="py-4 px-6">{ticket.summary}</td>
              <td className="py-4 px-6">{ticket.status}</td>
              <td className="py-4 px-6">{ticket.dev?.full_name}</td>
              <td className="py-4 px-6">{ticket.project.title}</td>
              {/* Add more cells as needed */}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TicketsTable;
