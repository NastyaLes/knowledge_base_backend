<?php
    $component=$_POST['component'];
    header("Access-Control-Allow-Origin: http://localhost:3000");
    $connect=new mysqli('localhost', 'admin1', 'admin1', 'site');
    $connect->set_charset('utf8');
    $stmt = $connect->prepare("SELECT users.fio, notes.content FROM users, notes, components WHERE notes.user_id = users.id_user AND notes.component_id = components.id_component AND components.name_component=?");
    $stmt->bind_param("s", $component);
    $stmt->execute();
    $answer = $stmt->get_result();
    $result = $answer->fetch_all(MYSQLI_ASSOC);
    $connect->close();
    exit(json_encode($result));