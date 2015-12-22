<?php
date_default_timezone_set("America/Lima");
require_once '../db/accesoDB.php';
class CategoriaDao{
	public function grabarCategoria($categoria){
		try {
			$pdo = AccesoDB::getConnectionPDO();
			$sql = "insert into categorias (nombre, descripcion, precio, archivo, categoria) values ('".$categoria["nombre"]."', '".$categoria["descripcion"]."', '".$categoria["precio"]."', '".$categoria["archivo"]."', '".$categoria["categoria"]."')";
			$rec = $pdo->exec($sql);
			return $rec;
		} catch (Exception $exc) {
			throw $exc;
		}
	}
	public function obtenerTotalRegistros(){
		try {
			$pdo = AccesoDB::getConnectionPDO();
			$sql = "select * from categorias";
			$stmt = $pdo->prepare($sql);
			$stmt->execute();
			$lista = $stmt->fetchAll();
			return $lista;
		} catch (Exception $exc) {
			throw $exc;
		}
	}
}
?>
