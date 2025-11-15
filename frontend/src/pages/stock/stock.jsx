import React, { useEffect, useState } from "react";
import Loading from "../_Template/component/loading/loading";
import api from "../../api/api";
import $ from "jquery";
import "datatables.net-bs4";
import "datatables.net-buttons-bs4";
import "datatables.net-buttons/js/buttons.html5.js";
import "datatables.net-buttons/js/buttons.print.js";

function Stock() {
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    if (data.length > 0) {
      if ($.fn.DataTable.isDataTable("#tableStock")) {
        $("#tableStock").DataTable().destroy();
      }
      $("#tableStock").DataTable({
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
      const res = await api.get("getStock");
      setData(res.data.data);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const totalJumlah = data.reduce((sum, item) => sum + item.jumlah_stock, 0);
  const totalHarga = data.reduce(
    (sum, item) => sum + item.jumlah_stock * item.harga_satuan,
    0
  );

  if (loading) return <Loading />;

  return (
    <>
      <div className="container-fluid">
        <div className="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 className="h3 mb-0 text-gray-800">Stock</h1>
        </div>
        <div className="card shadow mb-4">
          <div className="card-header py-3">
            <h6 className="m-0 font-weight-bold text-primary">Data Stock</h6>
          </div>
          <div className="card-body">
            <div className="table-responsive">
              <table
                className="table table-bordered table-solid"
                id="tableStock"
                width="100%"
                cellSpacing="0"
              >
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama Barang</th>
                    <th>Qty</th>
                    <th>Harga Satuan</th>
                    <th>Harga Total</th>
                  </tr>
                </thead>
                <tbody>
                  {data.map((item, i) => (
                    <tr key={i}>
                      <td>{i + 1}</td>
                      <td>{item.nama_barang}</td>
                      <td>{item.jumlah_stock}</td>
                      <td>{item.harga_satuan.toLocaleString("id-ID")}</td>
                      <td>
                        {(item.jumlah_stock * item.harga_satuan).toLocaleString(
                          "id-ID"
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
                <tfoot>
                  <tr>
                    <th colSpan={2} className="text-center"> Total </th>
                    <th>{totalJumlah}</th>
                    <th></th>
                    <th>Rp. {totalHarga.toLocaleString("id-ID")},00</th>
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

export default Stock;
