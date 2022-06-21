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
var email = document.getElementById("email").value;

if(title == "" ||  firstName == "" || lastName == "" ||  dob ==""  || 
address == "" ||pinCode == "" ||street == "" ||email == "" ||phone == "") {
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
var btnEdit = document.getElementById("myBtnEdit");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}
btnEdit.onclick = function() {
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
function printTable(divName) {
var printContents = document.getElementById(divName).innerHTML;
var originalContents = document.body.innerHTML;   
document.body.innerHTML = printContents;   
window.print();   
document.body.innerHTML = originalContents;
}

function closeAlertBox() {
document.getElementById("alertClass").style.display="none";
}

function closeAlertBoxy() {
document.getElementById("alertClass").style.display="none";
}

function closeAlertBoxes() {
document.getElementById("alert").style.display="none";
}

function closeAlertBoxSuccess() {
document.getElementById("alertSuccess").style.display="none";
}

$('.title').on('click',function(){
var edit_id=$(this).data('id');
if(edit_id > 0){
  $("#modal_title").text("Update");
    $.ajax({   
      url: "../components/userdefined.cfc",
      type: 'get',
      dataType:"json",
      data:{
      method:"addressBookEdit",
      edit_id:edit_id              
      },
      success: function(data){
        $('[name="contactId"]').val(data.DATA[0][0]);
        $('#title').val(data.DATA[0][2]);
        $('#firstName').val(data.DATA[0][3]);
        $('#lastName').val(data.DATA[0][4]);
        $('#email').val(data.DATA[0][5]);
        $('#phone').val(data.DATA[0][10]); 
        $('#street').val(data.DATA[0][11]);  
        $('#pinCode').val(data.DATA[0][12]); 
        $('#address').val(data.DATA[0][9]);   
        $('#dob').val(data.DATA[0][7]);
        $('#formId').attr('action', '../components/userdefined.cfc?method=addressBookUpdateContactForm'); 
        $('[name="defaultPhoto"]').val(data.DATA[0][8]);

        var gender = data.DATA[0][6];
        if(gender == "Male") {
          document.getElementById("gender1").checked = true;  
          }else{
          document.getElementById("gender2").checked = true;  
        } 
      },
      error:function(data){
      console.log(data);
      }
    });   
}else{
    $('#title').val("");
    $('#firstName').val("");
    $('#lastName').val("");
    $('#email').val("");
    $('#phone').val("");
    $('#street').val("");
    $('#pinCode').val("");
    $('#address').val("");
    $('#dob').val("");
    $('#formId').attr('action', '../components/userdefined.cfc?method=addressBookCreateContactForm'); 
  }  
}
);

function onValidateEmail(){
$("body").on('change', '#email', function() {
    var selectedValue = $(this).val();
        $.ajax({
        url: '../components/userDefined.cfc',
        type: 'get',
        dataType: "json",
        data: {
        method: "getUserByEmail",
        userEmail: selectedValue
        },
        success: function (data){
            if(data != 0){
              document.getElementById("alert").innerHTML ="The email id already exist,please try again";
            }
        }, 
        error: function (xhr, textStatus, errorThrown){
            console.log(xhr);
        }
    });
});
}

function onValidateEmailField(){
var emailId = $('#emailId').val();
$.ajax({
  url:"../components/userDefined.cfc",
  type:"get",
  dataType:"json",
  data:{
    method:"getUserEmailId",
      emailId : emailId
  },
  success : function(data){
    console.log(data);
    if(data.RECORDCOUNT == 1){
      $('.signup_email').css('display','block');
      $('.signup_email').text('Email Already Exists!');
      $('#reg_btn').prop('disabled', true);
    }else{
      $('.signup_email').css('display','none');
      $('.signup_email').text('');
      $('#reg_btn').prop('disabled',false);
    }
  },
  error:function(err){
    console.log(err);
  }
})
}

function onValidateUserName(){
var userName = $('#userName').val();
$.ajax({
  url:"../components/userDefined.cfc",
  type:"get",
  dataType:"json",
  data:{
    method:"getUserName",
      userName : userName
  },
  success : function(data){
    if(data.RECORDCOUNT == 1){
      $('.signup_username').css('display','block');
      $('.signup_username').text('Username Already Exists!');
      $('#reg_btn').prop('disabled', true);
    }else{
      $('.signup_username').css('display','none');
      $('.signup_username').text('');
      $('#reg_btn').prop('disabled',false);
    }
  },
  error:function(err){
    console.log(err);
  }
})
}

function validatePasswordField(){
var passwordInput = document.querySelector('input[name=password]');
var symbolPattern=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/; 
if(passwordInput.value.match(symbolPattern)){
  passwordInput.setCustomValidity('');
  return true;
}else{
  passwordInput.setCustomValidity("Minimum 8 characters Contain atleast 1 lowercase,uppercase character, Atleast 1 Number,1 special character");
  return false;
}
}

function validatePassword(){
var password = document.querySelector('input[name=password]');
var confirm = document.querySelector('input[name=confirmPassword]');
if (confirm.value === password.value) {
  confirm.setCustomValidity('');
} else {
  confirm.setCustomValidity('Passwords do not match');
} 
}














