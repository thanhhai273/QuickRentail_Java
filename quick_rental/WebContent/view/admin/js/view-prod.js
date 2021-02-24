$(document).ready(function (event) {
    $("#update-button").click(function (event) {
        // Lấy giá trị trong input
        var name = $('#input-prodname').val();
        var code = $('#input-prodcode').val();
        var price = $('#input-prodprice').val();
        var deposit = $('#input-deposit').val();
        var amount = $('#input-amount').val();
        var img1 = $("#selectedFile1")[0].files[0];
        var img2 = $("#selectedFile2")[0].files[0];
        var img3 = $("#selectedFile3")[0].files[0];
        var des = $('#input-des').val();

        if (name == '' && code == '' && price == '' && deposit == '' && amount == '' && img1 == null && img2 == null && img3 == null && des == '') {
            $("#invalid").css("display", "block");
            event.preventDefault();
        } else {
            $('#form-update-prod').submit();
        }
    });
});