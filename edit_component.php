<?php
$namee=$_POST['namee'];
$view=$_POST['view'];
$parameter=$_POST['parameter'];
$term=$_POST['term'];
require_once('connect.php');
$stmt = $connect->prepare("UPDATE components SET name_component=?, parameters=?, delivery_date=? WHERE name_component=?");
$stmt->bind_param("ssis", $namee, $parameter, $term, $namee);
$stmt->execute();
echo "Компонент успешно изменен";
$connect->close();