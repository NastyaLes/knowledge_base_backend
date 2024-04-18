<?php
$select=$_POST['select'];
require_once('connect.php');
$stmt = $connect->prepare("SELECT components.name_component, components.image, views.name_view, components.parameters, components.delivery_date, components.technical_information FROM components, views WHERE components.view_id = views.id_view AND views.name_view=?");
$stmt->bind_param("s", $select);
$stmt->execute();
$answer = $stmt->get_result();
$result = $answer->fetch_all(MYSQLI_ASSOC);
$connect->close();
exit(json_encode($result));