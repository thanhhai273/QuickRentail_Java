$(document).ready(function () {
    $("#submit-button").click(function (event) {
        // Lấy giá trị trong input
        var name = $('#name').val();
        var phone = $('#phone').val();
        var email = $('#email').val();
        var pass = $('#pass').val();
        var confirm = $('#confirm-pass').val();

        // Check validate các trường
        // validate name
        var flag1 = false;
        if (name == '') {
            $("#invalid00").css("display", "block");
        } else {
            flag1 = true;
            $("#invalid00").css("display", "none");
        }

        // validate phone
        flag2 = false;
        var regex_phone = /(0[0-9]{9})|(\([0-9]{3}\)\s+[0-9]{3}\-[0-9]{4})/;
        var checkphone = regex_phone.test(phone);
        if (phone != '') {
            if (!checkphone) {
                $("#invalid11").css("display", "block");
                $("#invalid01").css("display", "none");
            } else {
                flag2 = true;
                $("#invalid11").css("display", "none");
                $("#invalid01").css("display", "none");
            }
        } else {
            $("#invalid01").css("display", "block");
            $("#invalid11").css("display", "none");
        }

        // validate email
        var flag3 = false;
        var regex_email = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var checkemail = regex_email.test(email);
        if (email != '') {
            if (!checkemail) {
                $("#invalid12").css("display", "block");
                $("#invalid02").css("display", "none");
            } else {
                flag3 = true;
                $("#invalid12").css("display", "none");
                $("#invalid02").css("display", "none");
            }
        } else {
            $("#invalid02").css("display", "block");
            $("#invalid12").css("display", "none");
        }

        // validate password
        var flag4 = false;
        var regex_pass = /^(?=.*\d)(?=.*[A-Z])[0-9a-zA-Z]{8,}$/
        var checkpass = regex_pass.test(pass);
        if (pass != '') {
            if (!checkpass) {
                $("#invalid13").css("display", "block");
                $("#invalid03").css("display", "none");
            } else {
                flag4 = true;
                $("#invalid13").css("display", "none");
                $("#invalid03").css("display", "none");
            }
        } else {
            $("#invalid03").css("display", "block");
            $("#invalid13").css("display", "none");
        }

        // validate re-password
        var flag5 = false;
        if (confirm != '') {
            if (confirm != pass) {
                $("#invalid14").css("display", "block");
                $("#invalid04").css("display", "none");
            } else {
                flag5 = true;
                $("#invalid14").css("display", "none");
                $("#invalid04").css("display", "none");
            }
        } else {
            $("#invalid04").css("display", "block");
            $("#invalid14").css("display", "none");
        }

        if (flag1 && flag2 && flag3 && flag4 && flag5) {
            $('#form-register').submit();
        } else {
            event.preventDefault();
        }
    });
});