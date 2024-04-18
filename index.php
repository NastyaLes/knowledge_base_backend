<?php
$login=$_POST['login'];
$password=$_POST['password'];
require_once('connect.php');
if ($connect->connect_error) { //если возвращается описание последней ошибки подключения
    error_log("Соединение неудачно: " . $connect->connect_error);
}
$stmt = $connect->prepare("SELECT role_id FROM users WHERE login=? AND password=?"); //создание подготавливаемого запроса
$stmt->bind_param("ss", $login, $password); //связывание параметров с метками
$stmt->execute();
$stmt->bind_result($result); //связывание переменных с результатами запроса
$stmt->fetch();
if (!$result) {
    echo "Неверно";
}
else {
    echo $result;
}
$connect->close();