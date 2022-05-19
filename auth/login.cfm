<cfinclude template="../section/header.cfm">
<section class="addressbook">
    <div class="container grid">
        <div class="addressbook-form card flex">
            <div class="addressbook-sidebar-login">
                <!--- <img src=""> --->
            </div>
            <div class="addressbook-form-fields">
                <form>
                    <h1>LOGIN</h1>
                    <div class="form-control">
                        <input type="text" name ="username" placeholder="Username">
                    </div>
                    <div class="form-control">
                        <input type="password" name ="password" placeholder="Password">
                    </div>
                    <button class="btn btn-outline btn-login" type="submit">Login</button>
                    <div class="addressbook-form-footer my-4">
                        <p>Or Sign In Using fb or insta</p>
                        <p>Dont have an account?<span><a href="signup.cfm">Register here</a></span></p>
                    </div>
                </form>
            </div>  
        </div>
    </div>
</section>
<cfinclude template="../section/footer.cfm">

