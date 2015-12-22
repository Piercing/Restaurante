<?php  
require_once '../dao/TramiteDAO.php';
require_once '../dao/LicenciaDAO.php';
//creando los objetos del dao
$tramite = new TramiteDAO();
$licencia = new LicenciaDAO();
try {
	$listaTramitesPendientes = $tramite->obtenerTramitesPendientesCodigo();
	for($i=0;$i<count($listaTramitesPendientes);$i++){
		//agregando la data para cada tramite pendiente
		$data["codigounico"]=$listaTramitesPendientes[$i]["codigounico"];
		$result = $licencia->buscarLicenciaPorCodigo($data);
		$listaTramitesPendientes[$i]["datos"] = $result["datos"];
	}
} catch (Exception $e) {
	echo $e;
}
?>