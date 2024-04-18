<?php
    header("Access-Control-Allow-Origin: http://localhost:3000");
    $connect=new mysqli('localhost', 'admin1', 'admin1', 'site'); //подключение к базе данных сервера
    $connect->set_charset('utf8'); //задание кодировки
    $sql = $connect->query("SELECT name_view FROM views");
    if (!$sql) {
        echo "Запрос не выполнен";
    }
    $result = $sql->fetch_all(MYSQLI_ASSOC);
    $connect->close();
    exit(json_encode($result)); //Выводит сообщение и прекращает выполнение текущего скрипта
?>