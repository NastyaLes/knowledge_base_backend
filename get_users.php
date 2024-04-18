<?php
    require_once('connect.php');
    $sql = $connect->query("SELECT users.fio, users.login, roles.name_role FROM users, roles WHERE users.role_id = roles.id_role");
    if (!$sql) {
        echo "Запрос не выполнен";
    }
    $result = $sql->fetch_all(MYSQLI_ASSOC);
    $connect->close();
    exit(json_encode($result)); //Выводит сообщение и прекращает выполнение текущего скрипта