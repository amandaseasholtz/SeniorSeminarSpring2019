import React from "react";
import ReactDOM from "react-dom";
import Trip from "./components/Trip";

document.addEventListener("DOMContentLoaded", () => {
    const trip = document.querySelector("#trip");
    ReactDOM.render(<Trip/>, trip);
});