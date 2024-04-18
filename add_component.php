<?php
$namee=$_POST['namee'];
$view=$_POST['view'];
$parameter=$_POST['parameter'];
$term=$_POST['term'];
require_once('connect.php');
$stmt = $connect->prepare("INSERT INTO components (name_component, view_id, parameter_id, delivery_date) VALUES ( ?, ?, ?, ?)"); //создание подготавливаемого запроса
$stmt->bind_param("siii", $namee, $view, $parameter, $term); //связывание параметров с метками
$stmt->execute();
//$stmt->insert_id;
if (!$stmt->insert_id) {
    echo "Не удалось добавить компонент";
}
else {
    echo "Компонент успешно добавлен";
}
$connect->close();