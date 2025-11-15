import React from "react";
import Sidebar from "./component/sidebar/Sidebar";
import Navbar from "./component/navbar/Navbar";
import { Outlet } from "react-router-dom";

function Template({ user, setUser }) {
  return (
    <>
      {/* Page Wrapper */}
      <div id="wrapper">
        {/* Sidebar */}
        <Sidebar setUser={setUser} />
        {/* Sidebar */}

        {/* Content Wrapper */}
        <div id="content-wrapper" className="d-flex flex-column">
          {/* Main Content */}
          <div id="content">
            {/* Navbar */}
            <Navbar user={user} />
            {/* Navbar */}

            {/* <!-- Begin Page Content --> */}
            <Outlet />
            {/* <!-- Begin Page Content --> */}
          </div>
        </div>
      </div>
      {/* Page Wrapper */}
    </>
  );
}
export default Template;
