<?php  
require_once '../dao/categoriaDao.php';
$categoria["nombre"] = $_REQUEST["nombre"];
$categoria["descripcion"] = $_REQUEST["descripcion"];
$categoria["precio"] = $_REQUEST["precio"];
$categoria["archivo"] = $_REQUEST["archivo"];
$categoria["categoria"] = $_REQUEST["categoria"];
//creando los objetos del dao
$categoriaDao = new CategoriaDao();
try {
	$categoriaDao->grabarCategoria($categoria);
	header("Location:../view");
} catch (Exception $e) {
	echo $e;
}
?>