import React, { useState, useEffect } from "react";
import TicketsTable from './TicketsTable';
import TicketsKanban from './TicketsKanban';

function TicketsIndex({ projectId }) {
  const [tickets, setTickets] = useState([]);
  const [viewMode, setViewMode] = useState("table"); // or "kanban"

  useEffect(() => {
    const endpoint = projectId ? `/projects/${projectId}/tickets` : '/tickets/all_tickets';
    fetch(endpoint)
      .then(response => response.json())
      .then(data => setTickets(data))
      .catch(error => console.error('Error fetching data: ', error));
  }, [projectId]);


  const handleToggleViewMode = (newViewMode) => {
    setViewMode(newViewMode);
  };

  return (
    <div className="p-4">
      <div className="flex justify-center mb-4">
        <button
          className={`px-4 py-2 text-white rounded-l-lg ${viewMode === "table" ? 'bg-blue-600' : 'bg-gray-300'}`}
          onClick={() => handleToggleViewMode("table")}
        >
          Table View
        </button>
        <button
          className={`px-4 py-2 text-white rounded-r-lg ${viewMode === "kanban" ? 'bg-blue-600' : 'bg-gray-300'}`}
          onClick={() => handleToggleViewMode("kanban")}
        >
          Kanban View
        </button>
      </div>
      {/* Conditionally Render Views */}
      {viewMode === 'table' ? <TicketsTable tickets={tickets} /> : <TicketsKanban tickets={tickets} />}
    </div>
  );
};

export default TicketsIndex;
