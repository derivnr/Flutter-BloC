<?php
header("Access-Control-Allow-Origin: *");
include 'con.php';

$session_token = $_POST["session_token"];

if (isset($session_token)) {
    $session_token = $session_token;
    $updateStatement = $database_connection->prepare("UPDATE user SET session_token = NULL WHERE session_token = ?");
    $updateStatement->execute([$session_token]);


    $affected_rows = $updateStatement->rowCount();
    if ($affected_rows > 0) {
        echo json_encode(['status' => 'success', 'message' => 'Berhasil logout']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Session token tidak valid']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Permintaan tidak valid']);
}
