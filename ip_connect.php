
<?php
$servername "localhost";
$username "root"; $password="";
$database_name="ip lab data";
$conn mysqli_connect($server_name, $username, $password, $database_name); //now check the connection
if(!$conn)
{
}
{
die("Connection Failed:" mysqli_connect_error());
if(isset($_POST['save']))
$email = $_POST['email'];
$password= $_POST['password'];
$phone

$sql_query
"INSERT INTO entry_details (email, password) VALUES ($email', '$password')";
if (mysqli_query($conn, $sql_query))
echo "New Details Entry inserted successfully !";
}
{
}
else

echo "Error:
$sql

mysqli_close($conn);
mysqli_error($conn);
