$(document).ready(function() {
	var array = [];
	$(".tempTable").each(function() {
		array.push($(this).data("id"));
	});
	$.each(array, function(key, value) {
		$('#' + value).DataTable();
	});
});