<?php
header("Access-Control-Allow-Origin: *");
include 'con.php';

$username = $_POST["user"];
$password = $_POST["pass"];

if (isset($username) && isset($password)) {
    $statement = $database_connection->prepare("SELECT id, username, password FROM user WHERE username = ?");
    $statement->execute([$username]);
    $user = $statement->fetch(PDO::FETCH_ASSOC);

    if ($user && sha1($password) === $user['password']) {
        $session_token = bin2hex(random_bytes(16));

        $updateStatement = $database_connection->prepare("UPDATE user SET session_token = ? WHERE id = ?");
        $updateStatement->execute([$session_token, $user['id']]);

        echo json_encode([
            'status' => 'success',
            'session_token' => $session_token
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Kredensial tidak valid'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Permintaan tidak valid'
    ]);
}
