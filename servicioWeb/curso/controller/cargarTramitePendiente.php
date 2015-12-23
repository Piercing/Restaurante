<?php  
require_once '../dao/TramiteDAO.php';
//creando los objetos del dao
$tramite = new TramiteDAO();
$data["codigounico"] = $_REQUEST["codigounico"];
try {
	$tramite = $tramite->obtenerTramitePendiente($data);
} catch (Exception $e) {
	echo $e;
}
?>