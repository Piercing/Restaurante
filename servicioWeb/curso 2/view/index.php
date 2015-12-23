<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.::PANEL DE CONTROL::.</title>
<?php include("referencias.php");?>
<script language="javascript">
$(document).ready(function(){
	$("#usu").focus();
/*	--------------------------------------------
				MENSAJE SALIENTE
	---------------------------------------------*/
	$("#dialog-message").hide();
	<?php
	if(isset($_REQUEST["login"])){
	?>
	// mostrar el cuadro de dialogo
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
	$( "#dialog-message" ).dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
	});
	<?php
	}
	?>
});
</script>
</head>
<body>
<div id="dialog-message" title="Error al ingresar">
  <p>Verifique si sus datos de ingreso son correctos</p>
</div>
<div id="totalDiv">
  <div id="cabezaDiv">
    <center>
      <h1>Ingreso de las categorías</h1>
    </center>
  </div>
  <div id="cuerpoDiv">
    <div id="cuerpoDiv2"><br />
      <br />
      <center>
        <form name="frm1" id="frm1" method="post" action="../controller/registrarCategoria.php">
          <table width="500" height="104">
            <tr>
              <td width="107" align="left" class="textoFormulario"><u>NOMBRE:</u>&nbsp;&nbsp;</td>
              <td width="192" align="left"><input name="nombre" type="text" class="textoCaja" id="nombre" autocomplete="off" /></td>
            </tr>
            <tr>
              <td align="left" class="textoFormulario"><u>DESCRIPCIÓN:</u>&nbsp;&nbsp;</td>
              <td align="left"><input name="descripcion" type="text" class="textoCaja" id="descripcion" autocomplete="off" /></td>
            </tr>
            <tr>
              <td width="107" align="left" class="textoFormulario"><u>PRECIO:</u>&nbsp;&nbsp;</td>
              <td width="192" align="left"><input name="precio" type="text" class="textoCaja" id="precio" autocomplete="off" /></td>
            </tr>
            <tr>
              <td align="left" class="textoFormulario"><u>ARCHIVO:</u>&nbsp;&nbsp;</td>
              <td align="left"><input name="archivo" type="text" class="textoCaja" id="archivo" autocomplete="off" /></td>
            </tr>
            <tr>
              <td width="107" align="left" class="textoFormulario"><u>CATEGORIA:</u>&nbsp;&nbsp;</td>
              <td width="192" align="left"><input name="categoria" type="text" class="textoCaja" id="categoria" autocomplete="off" /></td>
            </tr>
            <tr>
              <td colspan="2" align="right"><input type="submit" value="REGISTRAR" /></td>
            </tr>
          </table>
        </form>
      </center>
    </div>
  </div>
</div>
</body>
</html>