<?php
include("../config/db.php");		
 $con=@mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$search = strip_tags(trim($_GET['q'])); 
$query = mysqli_query($con, "SELECT * FROM proveedores WHERE nombre_proveedor LIKE '%$search%' LIMIT 40");
$list = array();
while ($list=mysqli_fetch_array($query)){
	$data[] = array('id' => $list['id_proveedor'], 'text' => $list['nombre_proveedor']);
}
echo json_encode($data);
?>