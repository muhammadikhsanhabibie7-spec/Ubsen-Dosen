<?php
session_start();

include 'config/koneksi.php'; 

date_default_timezone_set('Asia/Jakarta'); // Set waktu ke WIB
$jam_sekarang = date('G'); // Format 24 jam 

// Jika jam 7 pagi sampai jam 17 sore (jam 5 sore kurang 1 menit)
if ($jam_sekarang >= 7 && $jam_sekarang < 17) {
    $bg_gambar = 'kelas_pagi.jpg';
} else {
    $bg_gambar = 'kelas_malam.png';
}

if (isset($_POST['login'])) {
    
    $username = mysqli_real_escape_string($koneksi, $_POST['username']);
    $password = md5($_POST['password']); 

    $query = mysqli_query($koneksi, "SELECT * FROM user WHERE username='$username' AND password='$password'");
    
    if(!$query) {
        die("Query Error: " . mysqli_error($koneksi));
    }

    $cek = mysqli_num_rows($query);

    if ($cek > 0) {
        $data = mysqli_fetch_assoc($query);
        $_SESSION['username'] = $data['username'];
        $_SESSION['role']     = $data['role'];
        
        $role_user = strtolower($data['role']);

        if($role_user == "admin"){
            header("location: admin/dashboard.php"); 
        } else if($role_user == "dosen"){
            header("location: dosen/dashboard.php");
        } else if($role_user == "akademik" || $role_user == "pegawai"){
            header("location: akademik/dashboard.php");
        } else {
            echo "<script>alert('Role [" . $data['role'] . "] tidak dikenali!'); window.location='index.php';</script>";
        }
        exit();
    } else {
        echo "<script>alert('Username atau Password salah!'); window.location='index.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login User</title>
    <style>
    body {
        background-image: url('image-login/<?php echo $bg_gambar; ?>');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;

        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        height: 100vh;
        display: flex;
        flex-direction: column;

        justify-content: center;
        align-items: center;

        transition: background-image 0.5s ease-in-out;
    }


    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        z-index: -1;
    }

    .login-box {
        width: 400px;
        background-color: rgba(51, 51, 51, 0.9);
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(5px);
    }

    .header {
        background-color: #1b4f86;
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        letter-spacing: 1px;
        border-bottom: 3px solid #111;
    }

    .form-container {
        padding: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .input-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        width: 100%;
        background: white;
        border-radius: 5px;
        overflow: hidden;
    }

    .input-group img {
        width: 40px;
        height: 40px;
        padding: 5px;
        background: #ddd;
    }

    .input-group input {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: none;
        outline: none;
    }

    .login-btn {
        background: linear-gradient(to bottom, #ffce3a, #e6a300);
        border: none;
        padding: 12px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 5px;
        color: #5a4400;
        width: 100%;
        transition: 0.3s;
        margin-top: 10px;
    }

    .login-btn:hover {
        background: linear-gradient(to bottom, #ffd65e, #ffb700);
        box-shadow: 0 0 10px #ffce3a;
    }

    .footer-text {
        color: #ccc;
        font-size: 13px;
        margin-top: 20px;
    }

    .footer-text a {
        color: #ffce3a;
        text-decoration: none;
        font-weight: bold;
    }

    .footer-text a:hover {
        text-decoration: underline;
    }

    .copyright-section {
        text-align: center;
        margin-top: 30px;
        color: #fff;
        font-size: 14px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);
    }
    </style>
</head>

<body>

    <div class="login-box">
        <div class="header">:: LOGIN USER ::</div>
        <form method="POST" action="" class="form-container">
            <div class="input-group">
                <img src="image-login/img_login_user.png" alt="User">
                <input type="text" name="username" placeholder="Username / NIDN" required autocomplete="off">
            </div>

            <div class="input-group">
                <img src="image-login/img_login_lock.png" alt="Lock">
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <button type="submit" name="login" class="login-btn">LOGIN</button>

            <div class="footer-text">
                Belum punya akun? <a href="registrasi.php">Registrasi Pegawai</a>
            </div>
        </form>
    </div>

    <div class="copyright-section">
        <?php 
        $tahun = date('Y');
        ?>
        <p>Copyright &copy; <?php echo $tahun; ?> <b>ICT Politeknik LP3I Jakarta</b></p>
    </div>

</body>

</html>