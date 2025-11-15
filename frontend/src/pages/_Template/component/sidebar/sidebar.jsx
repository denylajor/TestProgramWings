import React from "react";
import Swal from "sweetalert2";
import { Link } from "react-router-dom";
import { NavLink } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import api from "../../../../api/api";

function Sidebar({ setUser }) {
  const navigate = useNavigate();

  const Logout = async (e) => {
    e.preventDefault();
    try {
      const result = await Swal.fire({
        title: "Apakah Anda Yakin?",
        text: "Anda Akan Logout!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes!",
      });

      if (!result.isConfirmed) return;
      await api.post(`/logout`);
      localStorage.removeItem("session");
      setUser(null);
      navigate("/login");
      // eslint-disable-next-line no-unused-vars
    } catch (err) {
      Swal.fire({
        title: "Gagal Logout !",
        icon: "error",
        showConfirmButton: true,
      });
    }
  };

  return (
    <>
      <ul
        className="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        {/* Sidebar - Brand */}
        <Link
          className="sidebar-brand d-flex align-items-center justify-content-center"
          to="/"
        >
          <div className="sidebar-brand-icon rotate-n-15">
            <i className="fas fa-laugh-wink"></i>
          </div>
          <div className="sidebar-brand-text mx-3">TRANSAKSI BARANG</div>
        </Link>
        {/* Sidebar - Brand */}
        {/* Divider */}
        <hr className="sidebar-divider my-0"></hr>
        {/* Divider */}
        {/* Nav Item - Dashboard */}
        <li className="nav-item">
          <NavLink
            className={({ isActive }) =>
              isActive ? "active nav-link" : "nav-link"
            }
            to="/Template/dashboard"
          >
            <i className="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </NavLink>
        </li>
        {/* Nav Item - Dashboard */}
        <hr className="sidebar-divider"></hr>
        <div className="sidebar-heading">MENU</div>
        <li className="nav-item">
          <NavLink
            className={({ isActive }) =>
              isActive ? "active nav-link" : "nav-link"
            }
            to="/Template/transaksi"
          >
            <i className="fas fa-fw fa-chart-area"></i>
            <span>Transaksi</span>
          </NavLink>
        </li>
        <li className="nav-item">
          <NavLink
            className={({ isActive }) =>
              isActive ? "active nav-link" : "nav-link"
            }
            to="/Template/stock"
          >
            <i className="fas fa-fw fa-chart-area"></i>
            <span>Stock</span>
          </NavLink>
        </li>
        <hr className="sidebar-divider"></hr>
        <li className="nav-item">
          <a type="button" className="nav-link" href="#" onClick={Logout}>
            <i className="fas fa-fw fa-chart-area"></i>
            <span>Logout</span>
          </a>
        </li>

        {/* Divider */}
        <hr className="sidebar-divider d-none d-md-block"></hr>

        {/* Sidebar Toggler (Sidebar) */}
        <div className="text-center d-none d-md-inline">
          <button
            className="rounded-circle border-0"
            id="sidebarToggle"
          ></button>
        </div>
      </ul>
    </>
  );
}

export default Sidebar;
