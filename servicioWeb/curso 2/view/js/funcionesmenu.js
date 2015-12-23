$(document).ready(function(){
	//show tooltip when the mouse is moved over a list element 
	$("ul#social li").hover(function() {
		$(this).find("div").fadeIn("fast").show(); //add 'show()'' for IE
		$(this).mouseleave(function () { //hide tooltip when the mouse moves off of the element
			$(this).find("div").hide();
		});
	});
	//para mantener visible los menus
	$(".menucategoria, .menusubcategoria, .menu_producto").click(function() {
		return false;                                         
	});
	//efecto para mostrar las sub opciones
	$("span.menu_categoria a").click(function() {
		$(".opciones_menu_producto").fadeOut("fast");
		$(".opciones_menu_subcategoria").fadeOut("fast");
		if($(".opciones_menu_categoria").is(':hidden')){
			$(".opciones_menu_categoria").fadeIn("fast");
		}
		else if ($(".opciones_menu_categoria").is(':visible')) {
			$(".opciones_menu_categoria").fadeOut("fast");
		}
	});
	$("span.menu_subcategoria a").click(function() {
		$(".opciones_menu_producto").fadeOut("fast");
		$(".opciones_menu_categoria").fadeOut("fast");
		if($(".opciones_menu_subcategoria").is(':hidden')){
			$(".opciones_menu_subcategoria").fadeIn("fast");
		}
		else if ($(".opciones_menu_subcategoria").is(':visible')) {
			$(".opciones_menu_subcategoria").fadeOut("fast");
		}
	});
	$("span.menu_producto a").click(function() {
		$(".opciones_menu_categoria").fadeOut("fast");
		$(".opciones_menu_subcategoria").fadeOut("fast");
		if($(".opciones_menu_producto").is(':hidden')){
			$(".opciones_menu_producto").fadeIn("fast");
		}
		else if ($(".opciones_menu_producto").is(':visible')) {
			$(".opciones_menu_producto").fadeOut("fast");
		}
	});
	//para mocultar las sub opciones
	$(document).click(function() {
		$(".opciones_menu_categoria, .opciones_menu_subcategoria, .opciones_menu_producto").fadeOut("fast");
		$(".opciones_menu_categoria, .opciones_menu_subcategoria, .opciones_menu_producto").css({'vivibility': 'hidden'});
	});
	$('.opciones_menu_categoria, .opciones_menu_subcategoria, .opciones_menu_producto').click(function(event) { 
		event.stopPropagation(); //use .stopPropagation() method to avoid the closing of quick menu panel clicking on its elements 
	});
});