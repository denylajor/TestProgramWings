import React, { useEffect, useState } from "react";
import {
  BrowserRouter as Router,
  Route,
  Routes,
  Navigate,
} from "react-router-dom";
import Login from "./pages/login/Login";
import Loading from "./pages/_Template/component/loading/loading";
import Template from "./pages/_Template/Template";
import Dashboard from "./pages/dashboard/dashboard";
import Transaksi from "./pages/transaksi/transaksi";
import Stock from "./pages/stock/stock";
import TambahTransaksi from "./pages/tambahTransaksi/TambahTransaksi";

function App() {
  // localStorage.removeItem("session");
  // localStorage.removeItem("token");

  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    fetchUser();
  }, []);

  // fetch user dari API
  const fetchUser = async () => {
    const token = JSON.parse(localStorage.getItem("session"))?.token || null;
    if (!token) {
      setLoading(false);
      return;
    }

    try {
      setUser(JSON.parse(localStorage.getItem("session")));
    } catch (error) {
      localStorage.removeItem("session");
      setUser(null);
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <Loading />;

  const PublicRoute = ({ children }) =>
    !user ? children : <Navigate to="/Template" />;
  const ProtectedRoute = ({ children }) =>
    user ? children : <Navigate to="/login" />;

  return (
    <Router>
      <Routes>
        {/* default */}
        <Route
          path="/"
          element={
            user ? (
              <Navigate to="/Template/dashboard" />
            ) : (
              <Navigate to="/login" />
            )
          }
        />

        {/* Login  */}
        <Route
          path="/login"
          element={
            <PublicRoute>
              <Login setUser={setUser} />
            </PublicRoute>
          }
        />

        {/* Template  */}
        <Route
          path="/Template"
          element={
            <ProtectedRoute>
              <Template user={user} setUser={setUser} />
            </ProtectedRoute>
          }
        >
          {/* 👇 Di Dalam Template */}
          <Route path="dashboard" element={<Dashboard />} />
          <Route path="transaksi" element={<Transaksi />} />
          <Route path="stock" element={<Stock />} />
          <Route path="tambahTransaksi" element={<TambahTransaksi />} />
        </Route>

        {/* fallback */}
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </Router>
  );
}

export default App;
