<?php
$database_hostname = "localhost";
$database_user = "root";
$database_password = "";
$database_name = "flutter";

try {
    $database_connection = new PDO("mysql:host=$database_hostname;dbname=$database_name", $database_user, $database_password);
    $database_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Koneksi Berhasil";
} catch (PDOException $e) {
    // This will catch any PDOExceptions that were throw
    echo "Database Error: " . $e->getMessage();
}
