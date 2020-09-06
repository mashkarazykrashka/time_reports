<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Time Reports</title>
</head>

<body>
    <pre>
<?php

include_once('config.php');

$link = mysqli_connect($conf["host"], $conf["username"], $conf["password"], $conf["db"]);

if ($link->connect_errno) {
	echo "Не удалось подключиться к MySQL:{" . $link->connect_errno . "}" . $link->connect_error;
}

$dayName = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");

for ($i = 0; $i <= 6; $i++) {

	$sql = "SELECT `name`, AVG(`hours`) AS avg_hours FROM `employees`, `time_reports` 
	WHERE WEEKDAY(STR_TO_DATE(`date`, \"%m/%d/%Y\")) = ".$i." AND `time_reports`.`employee_id` = `employees`.`id` 
	GROUP BY `employee_id` 
	ORDER BY avg_hours DESC LIMIT 3";

	$result = mysqli_query($link, $sql);

	$rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

	echo '|'.$dayName["$i"].'| ';

	for ($j = 0; $j <= 2; $j++) {
		
		if ($rows[$j] !== NULL) {
			if($j !==0){
				echo ", ";
			}
		echo $rows[$j]['name'];
		echo "(" . round($rows[$j]['avg_hours'], 2). " hours)";
		}
		else echo "   ";
	}
	echo"|<br>";
}
?>







