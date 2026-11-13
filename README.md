<div align="center">

# 🌐 Web3 Hello DApp

<p align="center">
  <b>Smart Contract Hello World & Interactive Decentralized Application (DApp)</b>
</p>

<!-- Tech Stack Badges (for-the-badge) -->
[![Solidity](https://img.shields.io/badge/Solidity-%23363636.svg?style=for-the-badge&logo=solidity&logoColor=white)](https://soliditylang.org/)
[![Ethereum](https://img.shields.io/badge/Ethereum-3C3C3D?style=for-the-badge&logo=Ethereum&logoColor=white)](https://ethereum.org/)
[![Hardhat](https://img.shields.io/badge/Hardhat-FFF100?style=for-the-badge&logo=hardhat&logoColor=black)](https://hardhat.org/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![Ethers.js](https://img.shields.io/badge/Ethers.js-2535a0?style=for-the-badge&logo=ethereum&logoColor=white)](https://docs.ethers.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

<br/>

[🚀 Mulai Cepat](#-quick-start) • [🖥️ Frontend Preview](#-frontend-preview-dapp) • [📁 Struktur](#-struktur-proyek) • [📚 Dokumentasi](#-dokumentasi-lengkap)

---

</div>

## 📌 Ringkasan Proyek

Proyek ini adalah implementasi **Web3 Starter Pack** lengkap yang dirancang untuk pengembang yang ingin mempelajari alur kerja penuh pengembangan Web3:
1. Menulis Smart Contract di **Solidity**.
2. Mengompilasi, menguji, dan men-deploy dengan **Hardhat**.
3. Menghubungkan kontrak ke antarmuka web interaktif (**Frontend DApp**) menggunakan **Ethers.js** dan **Tailwind CSS**.

---

## ✨ Fitur Unggulan

| Komponen | Fitur | Keterangan |
| :--- | :--- | :--- |
| 📜 **Smart Contract** | `HelloWeb3.sol` | Memiliki state `message` dan fungsi hemat gas `setMessage` (`calldata`). |
| 💻 **Frontend DApp** | `frontend/index.html` | Desain Web3 Glassmorphism modern dengan simulasi transaksi on-chain. |
| 🦊 **Wallet Support** | Web3 Ready | Mendukung koneksi **MetaMask** & otomatis fallback ke **Hardhat Mock Mode**. |
| 📖 **Dokumentasi** | Folder `docs/` | Berisi analisis mendalam arsitektur dan panduan operasional lengkap. |

---

## 🖥️ Frontend Preview DApp

Aplikasi ini sudah dilengkapi antarmuka web interaktif di folder `frontend/` yang dapat dibuka langsung tanpa perlu server tambahan!

<details open>
<summary><b>▶️ Cara Menjalankan & Membuka Website Preview (Klik untuk Buka/Tutup)</b></summary>

<br/>

### Cara 1: Buka Langsung (Paling Mudah)
* Buka File Explorer ke folder: `d:\Projects\Codings\web3-hello\frontend\`
* Klik ganda (**double-click**) pada file **`index.html`**.

### Cara 2: Buka via PowerShell / CMD
```powershell
Start-Process "frontend/index.html"
```

> **Fitur Website:**
> - Menampilkan pesan terkini dari blockchain (`"Halo Dunia Web3!"`).
> - Input interaktif untuk mengubah isi pesan dengan animasi pemrosesan transaksi.
> - Tombol **Connect Wallet** (MetaMask / Mock Hardhat).
</details>

---

## 📁 Struktur Proyek

```text
web3-hello/
├── 📜 contracts/            # Smart Contract (Solidity)
│   └── Lock.sol            # Kontrak HelloWeb3
├── 🌐 frontend/             # Antarmuka Pengguna (Interactive DApp)
│   └── index.html          # Web UI (Tailwind CSS + Ethers.js)
├── 📚 docs/                 # Dokumentasi Komprehensif
│   ├── analisis-proyek.md  # Bedah teknis & arsitektur proyek
│   └── panduan-menjalankan.md # Panduan lengkap eksekusi perintah
├── 🚀 ignition/modules/     # Modul Deployment (Hardhat Ignition)
│   └── Lock.js
├── 🧪 test/                 # Skrip Pengujian Otomatis
│   └── Lock.js
├── ⚙️ hardhat.config.js     # Konfigurasi Hardhat (Solidity 0.8.28)
├── 📦 package.json          # Dependensi & script project
└── 📄 README.md
```

---

## 🚀 Quick Start

<details>
<summary><b>1. Instalasi Dependensi (Klik untuk melihat)</b></summary>

```bash
# Clone repositori
git clone https://github.com/Faraysz/web3-hello.git
cd web3-hello

# Instal package node
npm install
```
</details>

<details>
<summary><b>2. Kompilasi Kontrak (Compile)</b></summary>

```bash
npx hardhat compile
```
*Hasil kompilasi akan otomatis disimpan di folder `artifacts/` dan `cache/`.*
</details>

<details>
<summary><b>3. Menjalankan Unit Test (Test)</b></summary>

```bash
npx hardhat test
```
</details>

<details>
<summary><b>4. Menjalankan Local Blockchain (Node)</b></summary>

```bash
npx hardhat node
```
*Menyediakan 20 akun lokal gratis dengan saldo masing-masing 10.000 test ETH.*
</details>

<details>
<summary><b>5. Deploy ke Node Lokal (Deploy)</b></summary>

Buka tab terminal baru ketika node lokal sedang berjalan:
```bash
npx hardhat ignition deploy ./ignition/modules/Lock.js --network localhost
```
</details>

---

## 🔍 Preview Smart Contract

<details>
<summary><b>Lihat Source Code Kontrak (Solidity)</b></summary>

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
</details>

---

## 📚 Dokumentasi Lengkap

Untuk panduan mendalam dan studi kasus teknis:
- 📑 [Analisis Proyek & Arsitektur](docs/analisis-proyek.md)
- 🛠️ [Panduan Menjalankan & Troubleshooting](docs/panduan-menjalankan.md)

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).
