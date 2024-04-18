<?php
    require_once('connect.php');
    $sql = $connect->query("SELECT * FROM roles");
    if (!$sql) {
        echo "Запрос не выполнен";
    }
    $result = $sql->fetch_all(MYSQLI_ASSOC);
    $connect->close();
    exit(json_encode($result)); //Выводит сообщение и прекращает выполнение текущего скрипта