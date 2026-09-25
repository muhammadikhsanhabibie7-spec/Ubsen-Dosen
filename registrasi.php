<?php
include "config/koneksi.php";

if (isset($_POST['proses'])) {
    $nidn   = mysqli_real_escape_string($koneksi, $_POST['nidn']);
    $pass   = md5($_POST['psl']); 
    $nama   = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $role   = $_POST['role']; 

    $cek = mysqli_query($koneksi, "SELECT username FROM user WHERE username = '$nidn'");
    
    if (mysqli_num_rows($cek) > 0) {
        echo "<script>alert('NIDN sudah terdaftar!'); window.history.back();</script>";
    } else {
        $query_user = mysqli_query($koneksi, "INSERT INTO user (username, password, role) 
                                           VALUES ('$nidn', '$pass', '$role')");

        if ($query_user) {
            echo "<script>alert('Registrasi Berhasil sebagai $role!'); window.location='index.php';</script>";
        } else {
            echo "<script>alert('Gagal: " . mysqli_error($koneksi) . "');</script>";
        }
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Registrasi Akun</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        padding: 40px;
    }

    .container {
        background: white;
        width: 450px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        border-bottom: 3px solid #f1c40f;
        padding-bottom: 10px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    input,
    select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .btn {
        background: #27ae60;
        color: white;
        border: none;
        width: 100%;
        padding: 12px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
    }
    </style>
</head>

<body>
    <div class="container">
        <h2>REGISTRASI AKUN</h2>
        <form method="POST">
            <div class="form-group">
                <label>NIDN / Username:</label>
                <input type="text" name="nidn" required placeholder="Masukkan NIDN...">
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="psl" required placeholder="Buat Password...">
            </div>
            <div class="form-group">
                <label>Nama Lengkap:</label>
                <input type="text" name="nama" required placeholder="Nama lengkap...">
            </div>

            <div class="form-group">
                <label>Daftar Sebagai:</label>
                <select name="role" required>
                    <option value="">-- Pilih Akses --</option>
                    <option value="Admin">Admin</option>
                    <option value="Dosen">Dosen</option>
                    <option value="Pegawai">Akademik</option>
                </select>
            </div>

            <button type="submit" name="proses" class="btn">DAFTAR SEKARANG</button>
        </form>
    </div>
</body>

</html>