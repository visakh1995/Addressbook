<cfcomponent>

    <cffunction  name="addressBookSignup" access="remote" output="true" returnType="string">
        
        <cfargument  name="fullName" type="string" required="yes">
        <cfargument  name="emailId" type="string" required="yes">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfset local.aErrorMessages =  "">
        <cfif arguments.fullName EQ ''>
            <cfset local.aErrorMessages = 'Please provide your fullname'/>
        </cfif>
        <cfif arguments.emailId EQ '' OR NOT isValid("email",arguments.emailId)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.userName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid user name'/>
        </cfif>
        <cfif arguments.password EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid password'/>
        </cfif>
        <cfif arguments.confirmPassword EQ ''>
            <cfset local.aErrorMessages = 'Confirm password field cant be empty'/>
        </cfif>
        <cfif arguments.confirmPassword NEQ arguments.password>
            <cfset local.aErrorMessages = 'password does not match!'/>
        </cfif>

        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
        <cfelse>
            <cfparam name="arguments.fullName" default="">
            <cfparam name="arguments.emailId" default="">
            <cfparam name="arguments.userName" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.confirmPassword" default="">

            <!--- email and username validation starts--->
            <cfquery name="emailVerify">
                SELECT *FROM coldfusiion.addressbook_register WHERE emailId = "#arguments.emailId#";
            </cfquery>
            <cfquery name="userNameVerify">
                SELECT *FROM coldfusiion.addressbook_register WHERE userName = "#arguments.userName#";
            </cfquery>
            <cfif emailVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The email already registered'/>
                <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
            </cfif> 
            <cfif userNameVerify.RecordCount neq 0>
                <cfset local.aErrorMessages = 'The username already registered'/>
                <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">
            </cfif> 
            <!--- email and username validation ends--->

            <cfquery name="addData" result = result >
                INSERT INTO coldfusiion.addressbook_register(fullName,emailId,userName,password,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.fullName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.emailId#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.userName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#local.encodedPassword#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="1">      
                )
            </cfquery>
            <cfset local.message  ="Application submitted successfully">
            <cflocation  url="../auth/signup.cfm?aMessageSuccess=#local.message#">   
        </cfif>
    
    </cffunction>

    <cffunction  name="addressBookLogin" access="remote" output="true" returnType="string">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfset local.encodedPassword = hash("#arguments.password#", "SHA-256", "UTF-8")>

        <cfquery name="verifiedDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            userName = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.userName#"> AND 
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#local.encodedPassword#">
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifiedDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifiedDetails.userName#">
                <cfset Session.addressBookCredentials["password"] = "#verifiedDetails.password#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation  url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfset local.message  ="Invalid username or password">
            <cflocation  url="../auth/login.cfm?aMessages=#local.message#">  
        </cfif>
    </cffunction>

    <cffunction name="loggedOut" access="remote" output="true">
        <cfset StructDelete(Session, "addressBookCredentials")>
        <cflocation  url="../auth/login.cfm">
    </cffunction>

    <cffunction name="addressBookCreateContactForm" access="remote" output="true">
        <cfargument name="title" type="string" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="dob" type="string" required="true">
        <cfargument name="photo" type="string" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="pinCode" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="checks" type="string" required="true">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.title EQ ''>
            <cfset local.aErrorMessages = 'Please provide your title'/>
        </cfif>
        <cfif arguments.email EQ '' OR NOT isValid("email",arguments.email)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.lastName EQ ''> 
        <cfset local.aErrorMessages = 'Please provide valid last name'/>
        </cfif> 
        <cfif arguments.dob EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid dob'/>
        </cfif>
        <cfif arguments.photo EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid photo'/>
        </cfif>
        <cfif arguments.address EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid address'/>
        </cfif>
        <cfif arguments.pinCode EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid Pincode'/>
        </cfif>
        <cfif arguments.street EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid street name'/>
        </cfif>
        <cfif arguments.phone EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid phone'/>
        </cfif>
        <cfif arguments.checks EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid gender option'/>
        </cfif>
        <cfif len(trim(local.aErrorMessages)) NEQ 0>
            <cflocation  url="../pages/dashboard.cfm?aMessages=#local.aErrorMessages#">
        <cfelse>
            <cffile action="upload"
            fileField="photo"
            nameconflict="overwrite"
            destination="C:\coldFusion2021\cfusion\wwwroot\ADDRESSBOOK\uploads\">
    
            <cfset local.imageValue = #cffile.serverFile#>
    
            <cfparam name="arguments.title" default="">
            <cfparam name="arguments.firstName" default="">
            <cfparam name="arguments.lastName" default="">
            <cfparam name="arguments.email" default="">
            <cfparam name="arguments.password" default="">
            <cfparam name="arguments.dob" default="">
            <cfparam name="arguments.address" default="">
            <cfparam name="arguments.pinCode" default="">
            <cfparam name="arguments.street" default="">
            <cfparam name="arguments.phone" default="">
            <cfparam name="arguments.checks" default="">
            <cfparam name="imageValue" default="">
            <cfparam name="Session.addressBookCredentials.id" default="Not Authenticated">
    
            <cfquery name="addData" result = result>
                INSERT INTO coldfusiion.addressbook_contacts(userId,title,firstName,lastName,email,gender,dob,
                photo,address,phone,street,pincode,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="#Session.addressBookCredentials.id#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.title#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.firstName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.lastName#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.checks#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.dob#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#imageValue#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.address#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value ="#arguments.phone#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#arguments.pinCode#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Contact created successfully">
            <cflocation  url="../pages/dashboard.cfm?aMessageSuccess=#local.message#"> 
        </cfif>




    </cffunction>

    

</cfcomponent>