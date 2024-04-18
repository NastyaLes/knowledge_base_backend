<?php
$login=$_POST['login'];
header("Access-Control-Allow-Origin: http://localhost:3000");
$connect=new mysqli('localhost', 'admin1', 'admin1', 'site');
$connect->set_charset('utf8');
$stmt = $connect->prepare("DELETE FROM users WHERE login=?");
$stmt->bind_param("s", $login);
$stmt->execute();
$answer = $stmt->get_result();
echo "Пользователь успешно удален. Перезагрузите страницу";
$connect->close();