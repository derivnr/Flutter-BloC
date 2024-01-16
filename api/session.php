<?php
header("Access-Control-Allow-Origin: *");
include 'con.php';

$session_token = $_POST["session_token"];
if (isset($session_token)) {
    $statement = $database_connection->prepare("SELECT name FROM user WHERE session_token = ?");
    $statement->execute([$session_token]);
    $user = $statement->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        echo json_encode(['status' => 'success', 'hasil' => $user]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Session token tidak valid']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Permintaan tidak valid']);
}
