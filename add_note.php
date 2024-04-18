<?php
$note=$_POST['note'];
$component=$_POST['component'];
header("Access-Control-Allow-Origin: http://localhost:3000");
$connect=new mysqli('localhost', 'admin1', 'admin1', 'site'); //подключение к базе данных сервера
$connect->set_charset('utf8'); //задание кодировки
$stmt = $connect->prepare("INSERT INTO notes (content, component_id, user_id) VALUES (?, ?, 2)"); //создание подготавливаемого запроса
$stmt->bind_param("si", $note, $component); //связывание параметров с метками
$stmt->execute();
//$stmt->insert_id;
echo "Заметка успешно добавлена";
$connect->close();