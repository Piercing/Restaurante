<?php
require_once '../dao/LicenciaDAO.php';
$data["codigounico"]=$_REQUEST["codigounico"];
$licencia = new LicenciaDAO();
try {
	$result = $licencia->buscarLicenciaPorCodigo($data);
} catch (Exception $e) {
	echo $e;
}
echo $result["datos"];
?>