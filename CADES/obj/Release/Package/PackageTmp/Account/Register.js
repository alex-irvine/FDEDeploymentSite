var gbl_email = true;
var gbl_company = true;
var gbl_pass = true;
var gbl_pass_conf = true;

$("#NoJavascript").hide();

document.getElementById("MainContent_BtnReg").disabled = false;

$(function () { $('[data-toggle="popover"]').popover() });

function check_email(txtbox) {
    var mail_format = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (txtbox.value.match(mail_format)) {
        document.getElementById("MainContent_Email").style.border = "1px solid green";
        gbl_email = true;
    } else {
        document.getElementById("MainContent_Email").style.border = "1px solid red";
        gbl_email = false;
    }
    check_all();
}
function check_password(txtbox) {
    var pass_format_number = /\w*[0-9]+\w*/;
    var pass_format_letter = /[0-9]*\w+[0-9]*/;
    if (txtbox.value.match(pass_format_number) && txtbox.value.match(pass_format_letter) && txtbox.value.length >= 6) {
        document.getElementById("MainContent_Password").style.border = "1px solid green";
        document.getElementById("MainContent_Password").blur();
        document.getElementById("MainContent_Password").setAttribute("data-content", "Correct password");
        document.getElementById("MainContent_Password").focus();
        gbl_pass = true;
    } else {
        document.getElementById("MainContent_Password").style.border = "1px solid red";
        document.getElementById("MainContent_Password").blur();
        document.getElementById("MainContent_Password").setAttribute("data-content", "Password require numbers and letters, and must be over 6 characters long");
        document.getElementById("MainContent_Password").focus();
        gbl_pass = false;
    }
    check_all();
}
function check_passwords() {
    if (document.getElementById("MainContent_ConfirmPassword").value != "") {
        if (document.getElementById("MainContent_ConfirmPassword").value == document.getElementById("MainContent_Password").value) {
            document.getElementById("MainContent_ConfirmPassword").style.border = "1px solid green";
            document.getElementById("MainContent_Password").style.border = "1px solid green";
            gbl_pass_conf = true;
        } else {
            document.getElementById("MainContent_ConfirmPassword").style.border = "1px solid red";
            document.getElementById("MainContent_Password").style.border = "1px solid red";
            gbl_pass_conf = false;
        }
    }
    check_all();
}

function check_firstname() {
    if (document.getElementById("MainContent_FirstName").value != "") {
        document.getElementById("MainContent_FirstName").style.border = "1px solid green";
        gbl_company = true;
    } else {
        document.getElementById("MainContent_FirstName").style.border = "1px solid red";
        gbl_company = false;
    }
    check_all();
}

function check_lastname() {
    if (document.getElementById("MainContent_LastName").value != "") {
        document.getElementById("MainContent_LastName").style.border = "1px solid green";
        gbl_company = true;
    } else {
        document.getElementById("MainContent_LastName").style.border = "1px solid red";
        gbl_company = false;
    }
    check_all();
}

function check_company() {
    if (document.getElementById("MainContent_Company").value != "") {
        document.getElementById("MainContent_Company").style.border = "1px solid green";
        gbl_company = true;
    } else {
        document.getElementById("MainContent_Company").style.border = "1px solid red";
        gbl_company = false;
    }
    check_all();
}

function check_all() {
    if (gbl_company && gbl_email && gbl_pass && gbl_pass_conf) {
        document.getElementById("MainContent_BtnReg").disabled = false;
    } else {
        document.getElementById("MainContent_BtnReg").disabled = true;
    }
}