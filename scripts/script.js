function onAddressBookSignupValidate() {
    var fullName = document.getElementById("fullName").value;
    var emailId = document.getElementById("emailId").value;
    var userName = document.getElementById("userName").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    if(fullName == "" ||  emailId == "" || userName == "" || password =="" || confirmPassword =="" ) {
        document.getElementById("alert").innerHTML ="Please fill all fields";
        return false;
    }
    if(password != confirmPassword) {
        document.getElementById("alert").innerHTML ="Password does not match";
        return false;
    }
    if(!isNaN(fullName)) {
        document.getElementById("alert").innerHTML ="FullName field cant allow numbers";
        return false;
    }
}
