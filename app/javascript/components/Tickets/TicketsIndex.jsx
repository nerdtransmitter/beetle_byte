import React, { useState, useEffect } from "react";
import TicketsTable from './TicketsTable';
import TicketsKanban from './TicketsKanban';

function TicketsIndex({ tickets, projectId }) {
  const [viewMode, setViewMode] = useState("table"); // or "kanban"

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
      {viewMode === 'table' ? <TicketsTable tickets={tickets} projectId={projectId}/> : <TicketsKanban tickets={tickets} projectId={projectId}/>}
    </div>
  );
};

export default TicketsIndex;
