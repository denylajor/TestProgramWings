import React, { useEffect, useState } from "react";
import api from "../../api/api";
import Loading from "../_Template/component/loading/loading";
import Swal from "sweetalert2";
import { useNavigate } from "react-router-dom";

function TambahTransaksi() {
  const navigate = useNavigate();

  const [loading, setLoading] = useState(true);
  const [jenisTransaksi, setJenisTransaksi] = useState([]);
  const [barang, setBarang] = useState([]);
  const [selectJenisTrans, setSelectJenisTrans] = useState("");

  //   const [setSelectedJenis] = useState("");
  const [noTransaksi, setNoTransaksi] = useState("");
  const [selectBarang, setselectBarang] = useState("");
  const [tglTransaksi, setTglTransaksi] = useState("");
  const [selectJumlahBarang, setSelectJumlahBarang] = useState("");
  const [selectHargaSatuan, setSelectHargaSatuan] = useState("");
  const [selectKeterangan, setSelectKeterangan] = useState("");

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      const [transaksiRes, barangRes] = await Promise.all([
        api.get("jenisTransaksi"),
        api.get("masterBarang"),
      ]);

      setJenisTransaksi(transaksiRes.data.data);
      setBarang(barangRes.data.data);
    } finally {
      setLoading(false);
    }
  };

  const jenisTransChange = async (e) => {
    const value = e.target.value;
    setSelectJenisTrans(value);
    try {
      setLoading(false);
      const res = await api.get(`jenisTransaksi/noTransaksi/${value}`);
      setNoTransaksi(res.data.data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  const save = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const username =
        JSON.parse(localStorage.getItem("session"))?.username || null;

      const dataPengajuan = {
        jenisTransaksi: selectJenisTrans,
        noTransaksi: noTransaksi,
        barang: selectBarang,
        tglTransaksi: tglTransaksi,
        jumlahBarang: selectJumlahBarang,
        hargaSatuan: selectHargaSatuan,
        keterangan: selectKeterangan,
        username: username,
      };

      const saveResult = await api.post("simpanPengajuan", dataPengajuan);
      const result = await Swal.fire({
        title: saveResult.data.responseMessage,
        icon: "success",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes!",
      });

      if (!result.isConfirmed) return;
      navigate("/Template/transaksi");
    } catch (e) {
      Swal.fire({
        title: e.data.responseMessage,
        icon: "error",
        showConfirmButton: true,
      });
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
          <h1 className="h3 mb-0 text-gray-800">Tambah Transaksi</h1>
        </div>

        <div className="row">
          <div className="col-lg-12">
            <div className="card shadow mb-4">
              <div className="card-header py-3">
                <h6 className="m-0 font-weight-bold text-primary">
                  Form Tambah Transaksi
                </h6>
              </div>
              <div className="card-body">
                <form onSubmit={save}>
                  <div className="row">
                    <div className="col-lg-6">
                      <label htmlFor="Jenis Transaksi"> Jenis Transaksi</label>
                      <select
                        name="jenisTransaksi"
                        id="jenisTransaksi"
                        className="form-control"
                        onChange={jenisTransChange}
                        required
                      >
                        <option value="">--Pilih Jenis Transaksi--</option>
                        {jenisTransaksi.map((item) => (
                          <option
                            key={item.id_jenis_transaksi}
                            value={item.id_jenis_transaksi}
                          >
                            {item.jenis_transaksi}
                          </option>
                        ))}
                      </select>
                    </div>

                    <div className="col-lg-6">
                      <label htmlFor="No Transaksi">No Transaksi</label>
                      <input
                        type="text"
                        className="form-control"
                        name="noTransaksi"
                        id="noTransaksi"
                        style={{ color: "blue", fontWeight: "bold" }}
                        value={noTransaksi}
                        readOnly
                        onChange={(e) => setNoTransaksi(e.target.value)}
                        required
                      />
                    </div>
                  </div>

                  <br />

                  <div className="row">
                    <div className="col-lg-6">
                      <label htmlFor="Tgl Transaksi">Tgl Transaksi</label>
                      <input
                        type="date"
                        className="form-control"
                        name="tglTransaksi"
                        id="tglTransaksi"
                        onChange={(e) => setTglTransaksi(e.target.value)}
                        required
                      />
                    </div>

                    <div className="col-lg-6">
                      <label htmlFor="Nama Barang">Nama Barang</label>
                      <select
                        name="namaBarang"
                        id="namaBarang"
                        className="form-control"
                        onChange={(e) => setselectBarang(e.target.value)}
                        required
                      >
                        <option value="">--Pilih Nama Barang--</option>
                        {barang.map((item) => (
                          <option key={item.id_barang} value={item.id_barang}>
                            {item.nama_barang}
                          </option>
                        ))}
                      </select>
                    </div>
                  </div>

                  <br />

                  <div className="row">
                    <div className="col-lg-6">
                      <label htmlFor="Jumlah Barang"> Jumlah Barang</label>
                      <input
                        type="number"
                        className="form-control"
                        name="jmlbarang"
                        id="jmlbarang"
                        onChange={(e) => setSelectJumlahBarang(e.target.value)}
                        required
                      />
                    </div>
                    <div className="col-lg-6">
                      <label htmlFor="Harga Satuan"> Harga Satuan</label>
                      <input
                        type="number"
                        className="form-control"
                        name="hargaSatuan"
                        id="hargaSatuan"
                        onChange={(e) => setSelectHargaSatuan(e.target.value)}
                        required
                      />
                    </div>
                  </div>

                  <br />

                  <div className="row">
                    <div className="col-lg-12">
                      <label htmlFor="keterangan">Keterangan</label>
                      <textarea
                        className="form-control"
                        name="keterangan"
                        id="keterangan"
                        cols="30"
                        rows="5"
                        onChange={(e) => setSelectKeterangan(e.target.value)}
                        required
                      ></textarea>
                    </div>
                  </div>
                  <br />
                  <div className="text-center">
                    <button type="submit" className="btn btn-md btn-success">
                      Simpan
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default TambahTransaksi;
