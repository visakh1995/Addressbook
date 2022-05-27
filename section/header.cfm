<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="../scripts/script.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="navbar">
            <div class="container flex">
                <h2>ADDRESS BOOK</h2>
                <cfif structKeyExists(Session,"addressBookCredentials")>
                    <nav>
                        <ul>
                            <li><a href="../components/userdefined.cfc?method=loggedOut">Logout</a></li>
                        </ul>
                    </nav>
                <cfelse>
                    <nav>
                        <ul>
                            <li><a href="signup.cfm">Signup</a></li>
                            <li><a href="login.cfm">Login</a></li>
                        </ul>
                    </nav>
                </cfif>

            </div>
        </div>

