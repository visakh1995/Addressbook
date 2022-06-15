<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link href="../assets/css/fontawesome/css/all.css" rel="stylesheet" />
    </head>
    <body>
        <div class="navbar">
            <div class="container flex">
                <h2><i class="fa-solid fa-address-book"></i> ADDRESS BOOK</h2>
                <cfif structKeyExists(Session,"addressBookCredentials")>
                    <nav>
                        <ul>
                            <li>
                                <a href="../components/userdefined.cfc?method=loggedOut">
                                    <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </nav>
                <cfelse>
                    <nav>
                        <ul>
                            <li><a href="../auth/signup.cfm">Signup</a></li>
                            <li><a href="../auth/login.cfm">Login</a></li>
                        </ul>
                    </nav>
                </cfif>
            </div>
        </div>

