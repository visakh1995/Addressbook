<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form signup card flex">
            <div class="addressbook-sidebar-login">
                <span class="sidebar-logo">
                    <i class="fa-solid fa-address-book"></i>
                </span>
            </div>
            <div class="addressbook-form-fields">
                <form method="post" action="../components/userdefined.cfc?method=addressBookSignup">
                    <h1 class="signup-title">SIGNUP</h1>
                    <div id="alert"></div>
                    <cfif isDefined("aMessages")>
                        <div class="alertClass">
                            <cfoutput>
                                <cfset showMessage = ToString(ToBinary(aMessages))>
                                <p>#showMessage#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <cfif isDefined("aMessageSuccess")>
                        <div class="alertSuccess">
                            <cfoutput>
                                <p>#aMessageSuccess#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <div class="form-control">
                        <input type="text" name ="fullName" id ="fullName" 
                        placeholder="Fullname" required>
                    </div>
                    <div class="form-control">
                        <input type="email" name ="emailId" id ="emailId" required
                        placeholder="Email" onchange = "return onValidateEmailField()">
                        <span class="signup_email"></span>
                    </div>
                    <div class="form-control">
                        <input type="text" name ="userName" id ="userName" required
                        placeholder="Username" onchange = "return onValidateUserName()">
                        <span class="signup_username"></span>
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" id ="password" required
                        placeholder="Password" onchange ="return validatePasswordField()">
                        <span class="signup_password"></span>
                    </div>
                    <div class="form-control">
                        <input type="password" name ="confirmPassword" id ="confirmPassword" required
                        placeholder="Confirm password" onchange ="return validatePassword()">
                        <span class="signup_confirm"></span>
                    </div>
                    <button class="btn btn-outline btn-signup" id="reg_btn" type="submit" >REGISTER</button>
                </form>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

