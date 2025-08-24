import React from "react";

import "./App.css";

const App = () => {
  const [greeting, setGreeting] = React.useState("");
  React.useEffect(() => {
    fetch("/api/greet")
      .then((response) => response.json())
      .then((data) => setGreeting(data.message))
      .catch((error) => console.error("Error fetching greeting:", error));
  }, []);
  return (
    <div className="content">
      <h1>Rsbuild with React</h1>
      <h1>Test ci/cd</h1>
      {greeting && <p>{greeting}</p>}
      <p>Start building amazing things with Rsbuild.</p>
    </div>
  );
};

export default App;
