<?php
session_start();
include "config/koneksi.php";

$username = mysqli_real_escape_string($conn, $_POST['username']);
$password = md5($_POST['password']); 


$query = mysqli_query($conn, "SELECT * FROM user WHERE username='$username' AND password='$password'");
$cek = mysqli_num_rows($query);

if ($cek > 0) {
    $data = mysqli_fetch_assoc($query);

    
    if (empty($data['role'])) {
        echo "<script>alert('Akun Anda belum memiliki Role. Silakan hubungi Admin!'); window.location='index.php';</script>";
        exit();
    }

    $_SESSION['username'] = $data['username'];
    $_SESSION['role']     = $data['role'];
    $_SESSION['id_user']  = $data['id_user'];

    
    $role = strtolower($data['role']);

    if ($role == "admin") {
        header("location:admin/dashboard.php");
    } 
    else if ($role == "dosen") {
        header("location:dosen/dashboard.php");
    } 
    else if ($role == "pegawai" || $role == "akademik") {
        header("location:pegawai/dashboard.php");
    } 
    else {
        echo "<script>alert('Role [$role] tidak dikenali!'); window.location='index.php';</script>";
    }
    exit();

} else {
    
    echo "<script>alert('Username atau Password salah!'); window.location='index.php';</script>";
}

?>