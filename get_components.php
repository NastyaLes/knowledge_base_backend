<?php
    require_once('connect.php');
    $sql = $connect->query("SELECT components.id_component, components.name_component, components.image, views.name_view, components.parameters, components.delivery_date, components.technical_information FROM components, views WHERE components.view_id = views.id_view");
    if (!$sql) {
        echo "Запрос не выполнен";
    }
    $result = $sql->fetch_all(MYSQLI_ASSOC);
    $connect->close();
    exit(json_encode($result)); //Выводит сообщение и прекращает выполнение текущего скрипта