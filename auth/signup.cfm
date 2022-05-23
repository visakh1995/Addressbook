<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form signup card flex">
            <div class="addressbook-sidebar">
                <!--- <img src=""> --->
            </div>
            <div class="addressbook-form-fields">
                <form method="post" action="../components/userdefined.cfc?method=addressBookSignup">
                    <h1>SIGNUP</h1>
                    <div id="alert"></div>
                    <cfif isDefined("aMessages")>
                        <div class="alertClass">
                            <cfoutput>
                                <p>#aMessages#</p>
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
                        placeholder="Full Name">
                    </div>
                    <div class="form-control">
                        <input type="email" name ="emailId" id ="emailId"
                        placeholder="Email ID">
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
                        placeholder="Confirm Password">
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

