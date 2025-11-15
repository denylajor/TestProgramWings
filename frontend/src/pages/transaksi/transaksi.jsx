import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Loading from "../_Template/component/loading/loading";
import api from "../../api/api";
import $ from "jquery";
import "datatables.net-bs4";
import "datatables.net-buttons-bs4";
import "datatables.net-buttons/js/buttons.html5.js";
import "datatables.net-buttons/js/buttons.print.js";
import Swal from "sweetalert2";
import JSZip from "jszip";
window.JSZip = JSZip;
import ButtonAdmin from "./buttonAdmin";
import ButtonUser from "./buttonUser";
import ButtonTambah from "./buttonTambah";

function Transaksi() {
  const [role, setRole] = useState("");
  const [user, setUser] = useState("");
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    const session = JSON.parse(localStorage.getItem("session"));
    if (session && session.role) {
      setRole(session.role);
      setUser(session.username);
    }
  }, []);

  useEffect(() => {
    if (data.length > 0) {
      if ($.fn.DataTable.isDataTable("#tableTransaksi")) {
        $("#tableTransaksi").DataTable().destroy();
      }
      $("#tableTransaksi").DataTable({
        dom:
          "<'row'<'col-12 text-center'B>>" +
          "<'row mb-3'<'col-sm-1'l> <'col-sm-11 d-flex justify-content-end'f>>" +
          "<'row'<'col-12'tr>>" +
          "p",
        buttons: ["copy", "csv", "excel", "pdf", "print"],
        destroy: true,
        ordering: true,
        columnDefs: [],
      });
    }
  }, [data]);

  const loadData = async () => {
    try {
      const res = await api.get("getTransaksi");
      setData(res.data.data);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const approval = (status) => {
    switch (status) {
      case 1:
        return <p style={{ color: "green" }}>Sudah Approve</p>;
      case 2:
        return <p style={{ color: "green" }}>Ditolak</p>;
      case 0:
      default:
        return <p style={{ color: "green" }}>Menunggu Approve</p>;
    }
  };

  const action = (status, id) => {
    switch (status) {
      case 1:
        return "";
      case 2:
        return (
          <span className="btn btn-warning btn-circle" title="Revisi"></span>
        );
      case 0:
      default:
        return (
          <>
            <ButtonAdmin roleAllowed={["Admin"]} currentRole={role}>
              <span
                className="btn btn-success btn-circle"
                title="Approve"
                onClick={() => buttonApprove(id)}
              >
                <i className="fas fa-check"></i>
              </span>
            </ButtonAdmin>
            {" | "}
            <ButtonUser roleAllowed={["User"]} currentRole={role}>
              <span
                className="btn btn-danger btn-circle"
                title="Delete"
                onClick={() => buttonDelete(id)}
              >
                <i className="fas fa-trash"></i>
              </span>
            </ButtonUser>
          </>
        );
    }
  };

  const buttonApprove = async (id) => {
    try {
      setLoading(true);
      const resApprove = await api.patch(
        `approveTransaksi/${id}`,
        {
          user: user,
        },
        { withCredentials: true }
      );

      Swal.fire({
        title: resApprove.data.responseMessage,
        icon: "success",
        confirmButtonText: "OK!",
      });
      loadData();
    } catch (err) {
      Swal.fire({
        title: err.response?.data?.responseMessage,
        icon: "error",
        confirmButtonText: "OK!",
      });
    } finally {
      setLoading(false);
    }
  };

  const buttonDelete = async (id) => {
    try {
      const resDelete = await api.delete(`deleteTransaksi/${id}`, {
        withCredentials: true,
      });
      Swal.fire({
        title: resDelete.data.responseMessage,
        icon: "success",
        showCancelButton: true,
        confirmButtonText: "Yes!",
      });
      loadData();
    } catch (err) {
      console.error(err);
    }
  };

  const totalJumlah = data.reduce((sum, item) => sum + item.jumlah_barang, 0);
  const totalHarga = data.reduce(
    (sum, item) => sum + item.jumlah_barang * item.harga_satuan,
    0
  );

  if (loading) return <Loading />;

  return (
    <>
      <div className="container-fluid">
        <div className="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 className="h3 mb-0 text-gray-800">Transaksi</h1>
          <ButtonTambah roleAllowed={["User"]} currentRole={role}>
            <Link
              className="btn btn-md btn-primary"
              to={"/Template/tambahTransaksi"}
            >
              <span>Transaksi Baru</span>
            </Link>
          </ButtonTambah>
        </div>
        <div className="card shadow mb-4">
          <div className="card-header py-3">
            <h6 className="m-0 font-weight-bold text-primary">
              Data Transaksi
            </h6>
          </div>
          <div className="card-body">
            <div className="table-responsive">
              <table
                className="table table-bordered table-solid"
                id="tableTransaksi"
                width="100%"
                cellSpacing="0"
              >
                <thead>
                  <tr>
                    <th>No</th>
                    <th>No Transaksi</th>
                    <th>Jenis Transaksi</th>
                    <th>Tgl Transaksi</th>
                    <th>Nama Barang</th>
                    <th>Jumlah Barang</th>
                    <th>Harga Satuan</th>
                    <th>Harga Total</th>
                    <th>Keterangan</th>
                    <th>Approval</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {data.map((item, i) => (
                    <tr key={i}>
                      <td>{i + 1}</td>
                      <td>{item.no_transaksi}</td>
                      <td>{item.jenis_transaksi}</td>
                      <td>{item.tanggal_transaksi}</td>
                      <td>{item.nama_barang}</td>
                      <td>{item.jumlah_barang}</td>
                      <td>{item.harga_satuan.toLocaleString("id-ID")},00</td>
                      <td>
                        {(
                          item.harga_satuan * item.jumlah_barang
                        ).toLocaleString("id-ID")}
                        ,00
                      </td>
                      <td>{item.keterangan}</td>
                      <td>{approval(item.approval)}</td>
                      <td>{action(item.approval, item.id)}</td>
                    </tr>
                  ))}
                </tbody>
                <tfoot>
                  <tr>
                    <th colSpan={5} className="text-center">
                      Total
                    </th>
                    <th>{totalJumlah}</th>
                    <th></th>
                    <th>Rp. {totalHarga.toLocaleString("id-ID")},00</th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Transaksi;
