function abrir(direccion, pantallacompleta, herramientas, direcciones, estado, barramenu, barrascroll, cambiatamano, ancho, alto, izquierda, arriba, sustituir){
     var opciones = "fullscreen=" + pantallacompleta +
                 ",toolbar=" + herramientas +
                 ",location=" + direcciones +
                 ",status=" + estado +
                 ",menubar=" + barramenu +
                 ",scrollbars=" + barrascroll +
                 ",resizable=" + cambiatamano +
                 ",width=" + ancho +
                 ",height=" + alto +
                 ",left=" + izquierda +
                 ",top=" + arriba;
     var ventana = window.open(direccion,"venta",opciones,sustituir);
}
var prefixCategory="cat";
var prefixImgCat="imgCat";
function mostrarCategoria(cate,subcate) {
   var folderDIV=document.getElementById(prefixCategory+cate);
   var imgObject=document.getElementById(prefixImgCat+cate);
   var imgObject2=document.getElementById(prefixImgCat+cate+subcate);
   if (folderDIV==null || imgObject==null) return false;
   if (imgObject2.src.indexOf("folder_minus.gif")==-1) {
       imgObject.src="images/folder_minus.gif";
       imgObject2.src="images/folder_minus.gif";
       folderDIV.style.display="block";
   } else {
       imgObject.src="images/folder_plus.gif";
       folderDIV.style.display="none";
   }
   return true;
//alert(cate);
//alert(subcate);
}
function ShowHideCategory(index) {
   var folderDIV=document.getElementById(prefixCategory+index);
   var imgObject=document.getElementById(prefixImgCat+index);
   if (folderDIV==null || imgObject==null) return false;
   if (imgObject.src.indexOf("folder_minus.gif")==-1) {
       imgObject.src="images/folder_minus.gif";
       folderDIV.style.display="block";
   } else {
       imgObject.src="images/folder_plus.gif";
       folderDIV.style.display="none";
   }
   return true;
}
function goToCategory(route) {
   var listCategory=route.split(",");
   for (var i=0;i<listCategory.length;i++)
       ShowHideCategory(listCategory[i]);
   return true;
}
//MAYUSCULAS
function conMayusculas(field) {  
	field.value = field.value.toUpperCase();
}
function redondear(numero){
	redondeado = Math.round((numero)*100)/100;
	redondeado = redondeado.toFixed(2);
	return redondeado;
}