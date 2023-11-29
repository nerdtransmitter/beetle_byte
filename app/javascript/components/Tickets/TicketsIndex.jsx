import React, { useState } from "react";
import TicketsTable from './TicketsTable';
import TicketsKanban from './TicketsKanban';

const TicketsIndex = () => {
  const [viewMode, setViewMode] = useState("table");

  const handleToggleView = (newViewMode) => {
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
      {viewMode === "table" && <div className="tickets-table"><TicketsTable /></div>}
      {viewMode === "kanban" && <div className="kanban-board"><TicketsKanban /></div>}
    </div>
  );
};

export default TicketsIndex;
