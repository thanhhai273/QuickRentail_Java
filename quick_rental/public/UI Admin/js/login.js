$(document).ready(function () {
    $("#submit-button").click(function (event) {
        // Lấy giá trị trong input
        var email = $('#exampleInputEmail').val();
        var pass = $('#exampleInputPassword').val();

        // validate email
        var flag1 = false;
        var regex_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var checkemail = regex_email.test(email);
        if (email != '') {
            if (!checkemail) {
                $("#invalid01").css("display", "block");
                $("#invalid00").css("display", "none");
            } else {
                flag1 = true;
                $("#invalid00").css("display", "none");
                $("#invalid01").css("display", "none");
            }
        } else {
            $("#invalid00").css("display", "block");
        }

        // validate password
        var flag2 = false;
        var regex_pass = /^[a-zA-Z0-9]{6,}$/
        var checkpass = regex_pass.test(pass);
        if (pass != '') {
            if (!checkpass) {
                $("#invalid00").css("display", "none");
                $("#invalid02").css("display", "block");
            } else {
                flag2 = true;
                $("#invalid00").css("display", "none");
                $("#invalid02").css("display", "none");
            }
        } else {
            $("#invalid00").css("display", "block");
        }

        if (flag1 && flag2) {
            $('#form-login').submit();
        } else {
            event.preventDefault();
        }
    });
});