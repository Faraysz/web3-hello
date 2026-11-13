# Analisis Proyek `web3-hello`

Dokumen ini merangkum hasil analisis menyeluruh terhadap arsitektur, kode, dan status proyek smart contract ini.

---

## 1. Ringkasan Proyek

- **Nama Proyek**: `web3-hello`
- **Tipe Proyek**: Smart Contract Development berbasis Ethereum Virtual Machine (EVM).
- **Framework Utama**: [Hardhat](https://hardhat.org/) (`^2.26.1`) dengan plugin bundle `@nomicfoundation/hardhat-toolbox` (`^6.1.0`).
- **Versi Kompiler Solidity**: `0.8.28` (didefinisikan di `hardhat.config.js`).
- **Tujuan Proyek**: Proyek starter/fondasi ("Hello World") untuk mempelajari alur kerja pembuatan, pengujian, serta deployment smart contract di ekosistem Web3.

---

## 2. Struktur Direktori & Kondisi Komponen

```text
web3-hello/
├── contracts/
│   └── Lock.sol             <-- Berisi kontrak HelloWeb3 (mismatch nama file)
├── ignition/
│   └── modules/
│       └── Lock.js          <-- Deployment module Hardhat Ignition (masih template Lock)
├── test/
│   └── Lock.js              <-- Unit test Hardhat/Chai (masih template Lock)
├── hardhat.config.js        <-- Konfigurasi Hardhat (Solidity 0.8.28)
├── package.json             <-- Konfigurasi dependensi dan scripts npm
└── README.md                <-- Dokumentasi umum
```

### Detail Kondisi Tiap Komponen:

1. **`contracts/Lock.sol`**:
   - Berisi kontrak bernama `HelloWeb3`.
   - **Isu**: Terjadi ketidaksesuaian (*mismatch*) antara nama file (`Lock.sol`) dan nama kontrak di dalamnya (`HelloWeb3`). Konvensi Solidity mengharuskan nama file sama persis dengan nama kontrak utama (`HelloWeb3.sol`).

2. **`ignition/modules/Lock.js`**:
   - Masih merupakan skrip template bawaan `npx hardhat init` yang mencoba men-deploy kontrak bernama `Lock` dengan argumen waktu `unlockTime` dan pengiriman ETH (`lockedAmount`).
   - **Isu**: Skrip deploy ini akan gagal dieksekusi karena kontrak `Lock` sudah digantikan oleh `HelloWeb3`.

3. **`test/Lock.js`**:
   - Berisi 128 baris pengujian untuk kontrak `Lock` (validasi time-lock, ownership, withdraw, dan event).
   - **Isu**: Seluruh pengujian akan gagal (*error*) saat dijalankan karena mencari `ethers.getContractFactory("Lock")`.

4. **`package.json`**:
   - Script npm untuk `test` masih berupa default: `"echo \"Error: no test specified\" && exit 1"`.
   - Belum ada alias shortcut untuk perintah `compile` dan `test`.

---

## 3. Bedah Smart Contract (`HelloWeb3`)

Source code kontrak saat ini:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWeb3 {
    string public message = "Halo Dunia Web3!";

    function setMessage(string calldata _msg) public {
        message = _msg;
    }
}
```

### Karakteristik & Evaluasi:
- **State Variable `message`**: Dideklarasikan `public` sehingga Solidity secara otomatis membuat fungsi getter `message()`.
- **Fungsi `setMessage`**: Menerima parameter bertipe `string calldata`. Pemilihan lokasi data `calldata` sudah tepat dan hemat gas (*gas-efficient*) untuk input string yang bersifat read-only.
- **Akses Kontrol**: Fungsi `setMessage` dapat dipanggil oleh siapa saja (*permissionless*). Jika nantinya diinginkan hanya pemilik (*owner*) yang boleh mengubah pesan, perlu ditambahkan mekanisme *Ownable* (misal via OpenZeppelin).

---

## 4. Rekomendasi Perbaikan (Action Plan)

1. **Sinkronisasi Nama File**:
   - Ganti nama `contracts/Lock.sol` menjadi `contracts/HelloWeb3.sol`.
2. **Perbarui Skrip Deployment**:
   - Buat modul deployment baru di `ignition/modules/HelloWeb3.js` khusus untuk kontrak `HelloWeb3`.
3. **Perbarui Unit Test**:
   - Ganti skrip test di `test/` agar menguji:
     - Nilai inisial `message` sama dengan `"Halo Dunia Web3!"`.
     - Pemanggilan `setMessage("Pesan Baru")` berhasil mengubah nilai variabel `message`.
4. **Perbarui `package.json`**:
   - Tambahkan scripts:
     ```json
     "scripts": {
       "compile": "hardhat compile",
       "test": "hardhat test"
     }
     ```

