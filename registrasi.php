<?php
//Include file koneksi ke database
include "koneksi.php";


//menerima nilai dari kiriman form pendaftaran
$username = $_POST["username"];
$nama_lengkap = $_POST["nama_lengkap"];
$level = $_POST["level"];
$password = $_POST["password"];


//Query input menginput data kedalam tabel anggota
$sql = "insert into user (username,nama_lengkap,level,password) values
		('$username','$nama_lengkap','$level','$password')";

//Mengeksekusi/menjalankan query diatas	
$hasil = mysqli_query($conn, $sql);

//Kondisi apakah berhasil atau tidak
if ($hasil) {
	$login = "login.php";
	echo ("<script>location.href='$login'</script>");
	exit;
} else {
	echo "Ulangi";
	exit;
}
