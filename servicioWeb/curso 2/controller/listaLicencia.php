<?php  
require_once '../dao/LicenciaDAO.php';

$data["codigounico"] = $_REQUEST["param"];
$data["nombrecompleto"] = $_REQUEST["param"];
$data["razonsocial"] = $_REQUEST["param"];
$data["nombrecomercial"] = $_REQUEST["param"];
$data["ruc"] = $_REQUEST["param"];

$licencia = new LicenciaDAO();
try {
	$result = $licencia->buscarLicencia($data);
} catch (Exception $e) {
	echo $e;
}
echo json_encode($result);
?>