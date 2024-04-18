<?php
$fio=$_POST['fio'];
$role=$_POST['select'];
$login=$_POST['login'];
$password=$_POST['password'];
require_once('connect.php');
$stmt = $connect->prepare("INSERT INTO users (fio, login, password, role_id) VALUES ( ?, ?, ?, ?)"); //создание подготавливаемого запроса
$stmt->bind_param("sssi", $fio, $login, $password, $role); //связывание параметров с метками
if (!$stmt->execute()) {
    echo $connect->error;
}
$connect->close();