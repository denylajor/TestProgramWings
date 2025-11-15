import React, { useEffect, useState } from "react";
import api from "../../api/api";
import Loading from "../_Template/component/loading/loading";

function Dashboard() {
  const [loading, setLoading] = useState(true);
  const [barangMasuk, setBarangMasuk] = useState("");
  const [barangKeluar, setBarangKeluar] = useState("");
  const [blmApprove, setBlmApprove] = useState("");

  useEffect(() => {
    loadData();
  });

  const loadData = async () => {
    try {
      const [barangMasukRes, barangKeluarRes, blmApproveRes] =
        await Promise.all([
          api.get("barangMasuk"),
          api.get("barangKeluar"),
          api.get("blmApprove"),
        ]);
      
      setBarangMasuk(barangMasukRes.data.data);
      setBarangKeluar(barangKeluarRes.data.data);
      setBlmApprove(blmApproveRes.data.data);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <Loading />;

  return (
    <>
      <div className="container-fluid">
        {/* <!-- Page Heading --> */}
        <div className="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 className="h3 mb-0 text-gray-800">Dashboard</h1>
        </div>

        {/* <!-- Content Row --> */}
        <div className="row">
          {/* <!-- Earnings (Monthly) Card Example --> */}
          <div className="col-xl-3 col-md-6 mb-4">
            <div className="card border-left-primary shadow h-100 py-2">
              <div className="card-body">
                <div className="row no-gutters align-items-center">
                  <div className="col mr-2">
                    <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                      Barang Masuk
                    </div>
                    <div className="h5 mb-0 font-weight-bold text-gray-800">
                      {barangMasuk}
                    </div>
                  </div>
                  <div className="col-auto">
                    <i className="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* <!-- Earnings (Monthly) Card Example --> */}
          <div className="col-xl-3 col-md-6 mb-4">
            <div className="card border-left-success shadow h-100 py-2">
              <div className="card-body">
                <div className="row no-gutters align-items-center">
                  <div className="col mr-2">
                    <div className="text-xs font-weight-bold text-success text-uppercase mb-1">
                      Barang Keluar
                    </div>
                    <div className="h5 mb-0 font-weight-bold text-gray-800">
                      {barangKeluar}
                    </div>
                  </div>
                  <div className="col-auto">
                    <i className="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* <!-- Earnings (Monthly) Card Example --> */}
          <div className="col-xl-3 col-md-6 mb-4">
            <div className="card border-left-info shadow h-100 py-2">
              <div className="card-body">
                <div className="row no-gutters align-items-center">
                  <div className="col mr-2">
                    <div className="text-xs font-weight-bold text-info text-uppercase mb-1">
                      Belum Approve
                    </div>
                    <div className="row no-gutters align-items-center">
                      <div className="col-auto">
                        <div className="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                          {blmApprove}
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className="col-auto">
                    <i className="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </>
  );
}

export default Dashboard;
