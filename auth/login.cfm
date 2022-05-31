<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form card flex">
            <div class="addressbook-sidebar-login">
                <!--- <img src=""> --->
            </div>
            <div class="addressbook-form-fields">
                <div id="alert"></div>
                <form method="post" action="../components/userdefined.cfc?method=addressBookLogin">
                    <h1>LOGIN</h1>
                    <cfif isDefined("aMessages")>
                        <div class="alertClass">
                            <cfoutput>
                                <p>#aMessages#</p>
                            </cfoutput>
                        </div>
                    </cfif>
                    <div class="form-control">
                        <input type="text" name ="userName" id ="userName" 
                        placeholder="Username" required>
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" id ="password" 
                        placeholder="Password" required>
                    </div>
                    <button class="btn btn-outline btn-login" type="submit"
                        onclick ="return onAddressBookLoginValidate()">Login
                    </button>
                    <div class="addressbook-form-footer my-4">
                        <p>Or Sign In Using</p>
                        <a href="../components/userAuth.cfc?method=googleSignIn">google</a>
                        <a href="googleSignIn">Facebook</a>


                        <p>Dont have an account?<span><a href="signup.cfm">Register here</a></span></p>
                    </div>
                </form>
            </div>  
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

