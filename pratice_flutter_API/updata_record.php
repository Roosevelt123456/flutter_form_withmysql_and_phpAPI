

<?php
include ("dbconnection.php");
$con=dbconnection();


if (isset($_POST["name"])) {
	$name=$_POST["name"];
}
else return;
if (isset($_POST["email"])) {
	$email=$_POST["email"];
}
else return;
if (isset($_POST["password"])) {
	$password=$_POST["password"];
}
else return;

$sql3="UPDATE `user_table` SET `uname`='$name',`uemail`='$email',`upassword`='$password' WHERE `uemail`='$email'";

$exe=mysqli_query($con, $sql3);
$arr=[];

if($exe) {
	$arr["success"]="true";
}
else{
	$arr["success"]="false";
}
print(json_encode($arr)); 





?>