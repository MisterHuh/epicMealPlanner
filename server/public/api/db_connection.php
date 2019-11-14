<?php
$conn = mysqli_connect('localhost', 'root', 'root', 'MealPlan', 3306);

if(!$conn){
  throw new Exception(mysqli_connect_error());
};

if (!$conn->set_charset("utf8")) {
  printf("Error loading character set utf8: %s\n", $conn->error);
}


?>
