# Panduan Menjalankan Proyek (`Hardhat`)

Panduan ini berisi langkah-langkah teknis untuk mengompilasi, menguji, menjalankan blockchain lokal, men-deploy, dan berinteraksi dengan smart contract pada proyek ini.

---

## 1. Prasyarat

Pastikan dependensi Node.js telah terpasang di komputer Anda. Jika belum menginstal dependensi:
```bash
npm install
```

---

## 2. Perintah Dasar Hardhat

### A. Mengompilasi Smart Contract (*Compile*)
Mengompilasi source code Solidity menjadi bytecode dan ABI:
```bash
npx hardhat compile
```
*Hasil kompilasi akan tersimpan di dalam folder `artifacts/` dan `cache/`.*

---

### B. Menjalankan Unit Test (*Test*)
Mengeksekusi seluruh pengujian otomatis pada folder `test/`:
```bash
npx hardhat test
```
*Catatan: Pastikan skrip test sudah disinkronkan dengan kontrak yang ada.*

---

### C. Menjalankan Blockchain Lokal (*Local Node*)
Menjalankan simulasi jaringan Ethereum di komputer lokal (menyediakan 20 akun bawaan lengkap dengan saldo 10.000 test ETH):
```bash
npx hardhat node
```
> **Penting**: Biarkan jendela terminal ini tetap terbuka selama Anda ingin menggunakan jaringan lokal.

---

### D. Mendeploy Kontrak (*Deploy*)
Buka jendela terminal baru, lalu jalankan deployment menggunakan modul Hardhat Ignition:

- **Deploy ke Jaringan Lokal (Localhost Node)**:
  ```bash
  npx hardhat ignition deploy ./ignition/modules/HelloWeb3.js --network localhost
  ```

- **Deploy in-memory (Hardhat Network internal)**:
  ```bash
  npx hardhat ignition deploy ./ignition/modules/HelloWeb3.js
  ```

---

### E. Berinteraksi Langsung via Konsol Interaktif (*Console*)
Untuk membaca data atau memanggil fungsi kontrak secara interaktif melalui CLI:
```bash
npx hardhat console --network localhost
```

**Contoh interaksi di dalam konsol:**
```javascript
// 1. Ambil instance kontrak berdasarkan alamat yang diperoleh saat deploy
const hello = await ethers.getContractAt("HelloWeb3", "<ALAMAT_KONTRAK>");

// 2. Baca pesan saat ini
await hello.message();
// Output: 'Halo Dunia Web3!'

// 3. Ubah isi pesan
const tx = await hello.setMessage("Pesan baru dari console!");
await tx.wait();

// 4. Verifikasi pesan baru
await hello.message();
// Output: 'Pesan baru dari console!'
```

---

## 3. Catatan Penyelesaian Masalah (*Troubleshooting*)

- **Error: Contract 'Lock' does not exist**:
  Terjadi jika mencoba menjalankan modul `ignition/modules/Lock.js` atau `test/Lock.js` lama. Pastikan modul deploy dan test sudah disesuaikan dengan nama kontrak `HelloWeb3`.
- **Error: EPERM saat compile di Windows**:
  Jika Hardhat mengalami izin akses ke folder roaming config saat dijalankan di terminal terbatas, jalankan terminal sebagai Administrator atau pastikan direktori cache Hardhat memiliki izin tulis yang cukup.

