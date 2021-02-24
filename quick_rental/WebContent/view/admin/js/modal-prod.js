$(document).ready(function (event) {
    $("#add-button").click(function (event) {
        // Lấy giá trị trong input
        var name = $('#input-prodname').val();
        var code = $('#input-prodcode').val();
        var price = $('#input-prodprice').val();
        var deposit = $('#input-deposit').val();
        var amount = $('#input-amount').val();
        var img1 = $("#selectedFile1")[0].files[0];
        var img2 = $("#selectedFile2")[0].files[0];
        var img3 = $("#selectedFile3")[0].files[0];
        var prodCodePartner = $('#input-prodCodePartner').val();
        var importprice = $('#input-importprice').val();

        if (name == '' || code == '' || price == '' || deposit == '' || amount == '' || img1 == null || img2 == null || img3 == null || prodCodePartner == '' || importprice == '') {
            $("#invalid").css("display", "block");
            event.preventDefault();
        } else {
            $('#form-add-prod').submit();
        }
    });
});
$(".close").click(function (event) {
    // Xóa toàn bộ giá trị
    $('#input-prodname').val("");
    $('#input-prodcode').val("");
    $('#input-prodprice').val("");
    $('#input-deposit').val("");
    $('#input-amount').val("");
    $("#selectedFile1").val(null);
    $("#blah1").attr("src","view/admin/img/photos.png");
    $("#selectedFile2").val(null);
    $("#blah2").attr("src","view/admin/img/photos.png");
    $("#selectedFile3").val(null);
    $("#blah3").attr("src","view/admin/img/photos.png");
    $('#input-des').val("");
});