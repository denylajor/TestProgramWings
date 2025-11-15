import React, { useState } from "react";
import axios from "axios";
import Swal from "sweetalert2";
import { useNavigate } from "react-router-dom";

const Login = ({ setUser }) => {
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");

  const handleLogin = async (e) => {
    e.preventDefault();

    const params = new URLSearchParams();
    params.append("username", username);
    params.append("password", password);

    try {
      const response = await axios.post(
        "http://localhost:8000/api/login",
        params,
        {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        }
      );

      const userData = {
        username: username,
        role: response.data.user.role,
        lastLogin: new Date().toISOString(),
        token: response.data.token,
      };

      let session = JSON.parse(localStorage.getItem("session")) || [];
      session.push(userData);
      localStorage.setItem("session", JSON.stringify(userData));

      setUser(userData);

      Swal.fire({
        icon: "success",
        title: "Login Berhasil",
        text: `Selamat datang, ${userData.username}!`,
        timer: 700,
        showConfirmButton: false,
      });

      navigate("/Template/dashboard");
    } catch (error) {
      if (error.response) {
        setMessage(error.response.data.responseMessage || "Login gagal");
        Swal.fire({
          icon: "error",
          title: "Login Gagal",
          text: error.response?.data?.message || "Terjadi kesalahan",
          showConfirmButton: true,
        });
      } else {
        setMessage("Login gagal: Server error");
        Swal.fire({
          icon: "error",
          title: "Login Gagal",
          text: "Login gagal: Server error",
          showConfirmButton: true,
        });
      }
    }
  };

  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
      }}
    >
      <div
        style={{
          flex: 1,
          background: "linear-gradient(135deg, #007bff, #6610f2)",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <div
          className="bg-white p-4 rounded shadow"
          style={{ width: "100%", maxWidth: "400px" }}
        >
          <h3 className="text-center mb-3">Login</h3>
          <form onSubmit={handleLogin}>
            <div className="mb-3">
              <label className="form-label">Username</label>
              <input
                type="text"
                className="form-control"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>
            <div className="mb-3">
              <label className="form-label">Password</label>
              <input
                type="password"
                className="form-control"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            <button type="submit" className="btn btn-primary w-100">
              Login
            </button>
          </form>

          {message && <p className="mt-3 text-center">{message}</p>}
        </div>
      </div>
    </div>
  );
};

export default Login;
