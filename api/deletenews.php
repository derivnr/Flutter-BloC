<?php
include 'con.php';
$id = $_POST["idnews"];

try {
    $statement = $database_connection->prepare("DELETE FROM `news_catalog` WHERE `news_catalog`.`id` = ?");
    $statement->execute([$id]);
    $pesan = "Data berhasil dihapus";
    echo $pesan;
} catch (PDOException $e) {
    // This will catch any PDOExceptions that were throw
    echo "Database Error: " . $e->getMessage();
}
