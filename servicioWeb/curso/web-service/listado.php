<?php  
require_once '../dao/categoriaDao.php';
//creando los objetos del dao
$categoriaDao = new CategoriaDao();
$listadoCategoria;
try {
	$listadoCategoria = $categoriaDao->obtenerTotalRegistros();
} catch (Exception $e) {
	echo $e;
}
echo json_encode($listadoCategoria);
?>