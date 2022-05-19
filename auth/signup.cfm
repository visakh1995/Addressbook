<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form signup card flex">
            <div class="addressbook-sidebar">
                <!--- <img src=""> --->
            </div>
            <div class="addressbook-form-fields">
                <cfif isDefined("aMessages")>
                    <div class="alert">
                        <cfoutput>
                            <p>#aMessages#</p>
                        </cfoutput>
                    </div>
                </cfif>
                <form method="post" action="../components/userdefined.cfc?method=addressBookSignup">
                    <h1>SIGNUP</h1>
                    <div class="form-control">
                        <input type="text" name ="fullName" placeholder="Full Name">
                    </div>
                    <div class="form-control">
                        <input type="text" name ="emailId" placeholder="Email ID">
                    </div>
                    <div class="form-control">
                        <input type="text" name ="userName" placeholder="Username">
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" placeholder="Password">
                    </div>
                    <div class="form-control">
                        <input type="password" name ="confirmPassword" placeholder="Confirm Password">
                    </div>
                    <button class="btn btn-outline btn-signup" type="submit">REGISTER</button>
                </form>
            </div>
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

