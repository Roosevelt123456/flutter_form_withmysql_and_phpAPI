<?php 
include ("./dbconnection.php");
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
$sql="INSERT INTO `user_table`(`uname`, `uemail`, `upassword`) VALUES ('$name','$email','$password')";
    
 $exe=mysqli_query($con, $sql);

$arr=[];
echo "string";
if ($exe)
{
	$arr["success"]="true";
}
else{
	$arr["success"]="false";
}
print(json_encode($arr));

?>