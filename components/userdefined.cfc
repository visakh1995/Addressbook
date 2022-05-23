<cfcomponent>

    <cffunction  name="addressBookSignup" access="remote" output="true" returnType="string">
        
        <cfargument  name="fullName" type="string" required="yes">
        <cfargument  name="emailId" type="string" required="yes">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">

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
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#hash(arguments.password)#">,
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
        <cfquery name="verifiedDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            userName = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.userName#"> AND 
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#arguments.password#">
        </cfquery>

        <cfif verifiedDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
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
</cfcomponent>