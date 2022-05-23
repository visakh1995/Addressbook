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
function onAddressBookContactValidate(){
  var title = document.getElementById("title").value;
  var firstName = document.getElementById("firstName").value;
  var lastName = document.getElementById("lastName").value;
  var gender = document.getElementById("gender").value;
  var dob = document.getElementById("dob").value;
  var photo = document.getElementById("photo").value;
  var address = document.getElementById("address").value;
  var pinCode = document.getElementById("pinCode").value;
  var street = document.getElementById("street").value;
  var phone = document.getElementById("phone").value;

  if(title == "" ||  firstName == "" || lastName == "" || gender =="" || dob =="" || 
  photo == "" ||address == "" ||pinCode == "" ||street == "" ||email == "" ||phone == "") {
    document.getElementById("alert").innerHTML ="Please fill all fields";
    return false;
  }


}

function onAddressBookTriggerContact(){
      // Get the modal
  var modal = document.getElementById("myModal");
  
  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");
  
  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];
  
  // When the user clicks the button, open the modal 
  btn.onclick = function() {
    modal.style.display = "block";
  }
  
  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }
  
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}



 
