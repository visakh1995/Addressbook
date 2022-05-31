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
  var dob = document.getElementById("dob").value;
  var photo = document.getElementById("photo").value;
  var address = document.getElementById("address").value;
  var pinCode = document.getElementById("pinCode").value;
  var street = document.getElementById("street").value;
  var phone = document.getElementById("phone").value;
  var yes = document.getElementById("yes").value;
  var no = document.getElementById("no").value;

  if(title == "" ||  firstName == "" || lastName == "" ||  dob =="" || 
    photo == "" ||address == "" ||pinCode == "" ||street == "" ||email == "" ||phone == "") {
      document.getElementById("alert").innerHTML ="Please fill all required fields";
      return false;
    }
  if(!isNaN(firstName) || !isNaN(lastName) ) {
    document.getElementById("alert").innerHTML ="Name field cant allow numbers";
    return false;
  }
  if(isNaN(pinCode)) {
    document.getElementById("alert").innerHTML ="Invalid pincode";
    return false;
  }
  var phoneNum = phone.replace(/[^\d]/g, '');
    if(phoneNum.length > 6 && phoneNum.length < 11) { 
    return true;
  }else{
    document.getElementById("alert").innerHTML ="please provide valid phone number";
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

function printContactDirectory(){
  alert("shows");
}






 
