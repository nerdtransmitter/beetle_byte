import React, { useState } from "react";
import TicketsTable from './TicketsTable';
import TicketsKanban from './TicketsKanban';

const TicketsIndex = () => {
  const [view, setView] = useState("table");

  const handleToggleView = (newView) => {
    setView(newView);
  };

  return (
    <div className="p-4">
      <div className="flex justify-center mb-4">
        <button
          className={`px-4 py-2 text-white rounded-l-lg ${view === "table" ? 'bg-blue-600' : 'bg-gray-300'}`}
          onClick={() => handleToggleView("table")}
        >
          Table View
        </button>
        <button
          className={`px-4 py-2 text-white rounded-r-lg ${view === "kanban" ? 'bg-blue-600' : 'bg-gray-300'}`}
          onClick={() => handleToggleView("kanban")}
        >
          Kanban View
        </button>
      </div>
      {view === "table" && <div className="tickets-table"><TicketsTable/></div>}
      {view === "kanban" && <div className="kanban-board"><TicketsKanban/></div>}
    </div>
  );
};

export default TicketsIndex;
