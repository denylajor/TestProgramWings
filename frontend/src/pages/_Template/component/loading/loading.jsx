import React from "react";
import "../../../../css/loading/loading.css"; // pastikan import CSS

const Loading = () => {
  return (
    <div className="loading-container">
      <div className="spinner"></div>
      <p>Loading...</p>
    </div>
  );
};

export default Loading;
