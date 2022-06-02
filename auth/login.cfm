<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form card flex">
            <div class="addressbook-sidebar-login">
                <span class="sidebar-logo"><i class="fa-solid fa-address-book"></i></span>
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
                    <div class="addressbook-form-footer">
                        <h5>Or Sign In Using</h5>
                        <div class="o-auth">
                            <span class="google"><a href="../components/userAuth.cfc?method=googleSignIn">
                                <i class="fa-brands fa-google"></i>
                            </a></span>
                            <span class="facebook"><a href="../components/userAuth.cfc?method=facebookSignIn">
                                <i class="fa-brands fa-facebook"></i>
                            </a></span>
                        </div>
                        <h5>Dont have an account?<span><a href="signup.cfm">Register here</a></span></h5>
                    </div>
                </form>
            </div>  
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

