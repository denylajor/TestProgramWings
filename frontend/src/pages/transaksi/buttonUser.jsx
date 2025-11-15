import React from "react";

/**
 * ProtectedButton
 * Hanya menampilkan children jika role user termasuk dalam roleAllowed
 * @param {Array} roleAllowed - Array role yang diperbolehkan, contoh ["admin", "user"]
 * @param {string} currentRole - Role user saat ini
 * @param {ReactNode} children - Konten tombol atau komponen lain
 */
const ButtonUser = ({ roleAllowed, currentRole, children }) => {
  if (roleAllowed.includes(currentRole)) {
    return <>{children}</>;
  }
  return null;
};

export default ButtonUser;
