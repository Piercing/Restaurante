<?php  
require_once '../dao/PagoDAO.php';
//creando los objetos del dao
$pago = new PagoDAO();
$listaPagosPendientes = array();
try {
	$listaPagosPendientes = $pago->listaPagosPendientes();
} catch (Exception $e) {
	echo $e;
}
?>