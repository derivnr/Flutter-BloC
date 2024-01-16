<?php
include 'con.php';
$quwery = "SELECT * FROM `news_catalog`";
$statement = $database_connection->prepare($quwery);
$statement->execute();

$data = array();
while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
    $data[] = $row;
}

echo json_encode($data);
