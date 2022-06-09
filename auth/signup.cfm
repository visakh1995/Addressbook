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
                                <span class="closebtn" onclick="closeAlertBox()">&times</span> 
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
                        placeholder="Fullname">
                    </div>
                    <div class="form-control">
                        <input type="email" name ="emailId" id ="emailId"
                        placeholder="Email">
                    </div>
                    <div class="form-control">
                        <input type="text" name ="userName" id ="userName"
                        placeholder="Username">
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" id ="password"
                        placeholder="Password">
                    </div>
                    <div class="form-control">
                        <input type="password" name ="confirmPassword" id ="confirmPassword"
                        placeholder="Confirm password">
                    </div>
                    <button class="btn btn-outline btn-signup" type="submit" 
                        onclick ="return onAddressBookSignupValidate()">REGISTER
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

