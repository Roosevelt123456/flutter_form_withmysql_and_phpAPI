<?php
include("dbconnection.php");
$con=dbconnection();




if (isset($_POST["id"])) {
	$id=$_POST['id']
}
else return;

$sql2="DELETE FROM `user_table` WHERE uid='$id'";

$exe=mysqli_query($con,$sql2);

arr=[];

if ($exe) {
	$arr["success"]="true";
}
else{
	$arr["success"]="false";
}
print(json_encode($arr));

?>




