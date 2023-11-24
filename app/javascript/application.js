import 'bootstrap';
import "@popperjs/core";
import "@hotwired/turbo-rails"

// Import your custom confetti module (if it exists)
import "./confetti";

import React from "react";
import ReactDOM from "react-dom";
import App from './components/App';


document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(document.getElementById('root'));
  root.render(<App />);
});

// // example component
// function ExampleComponent() {
//   return <h1>Hello from React</h1>;
// }

// document.addEventListener("DOMContentLoaded", () => {
//   ReactDOM.render(
//     <ExampleComponent />,
//     document.body.appendChild(document.createElement("div"))
//   );
// });
