var showTuto = function (id) {
	var displayedTuto = new Array();
	$("#tutoPlaceholder").html("");

	tutorials.forEach(function (element, index, array) {
		if (element.id == id) displayedTuto.push(element);
	});

	displayedTuto.forEach(function (element, index, array) {
		$("#tutoPlaceholder").append("<h2 class='tutoTitle'>" + element.title + "</h2>" + "<strong>Page " + element.page + "</strong>" + element.text);
	});
}