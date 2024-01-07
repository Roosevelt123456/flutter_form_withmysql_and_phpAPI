
<?php

include ("./dbconnection.php");
$con=dbconnection();

$sql1="SELECT `uid`, `uname`, `uemail`, `upassword` FROM `user_table`";

$exe=mysqli_query($con,$sql1);

$arr=[];

while ($row=mysqli_fetch_array($exe)) {

$arr[]=$row;
}
print(json_encode($arr));

?>