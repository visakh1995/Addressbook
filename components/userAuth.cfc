<cfcomponent persistant ="true">
    <cffunction name="googleSignIn" access="remote">
        <cfoauth
            type="Google"
            clientid="675092712119-46rfgtbg4ph9dh0tlvepfphd6hr2fito.apps.googleusercontent.com"
            secretkey="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"
            result="res"
            scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
            redirecturi="http://127.0.0.1:8500/ADDRESSBOOK/components/userAuth.cfc?method=googleSignIn"
        >
        <cfquery name="verifyGoogleDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            email = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#res.other.email#"> AND 
        </cfquery>

        <cfif verifyGoogleDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = checkquery.id>
                <cfset Session.addressBookCredentials["loggedin"] = true>
                <cfset Session.addressBookCredentials["logwith"] = "google">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation  url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfquery name="addGoogleData" result = result>
                INSERT INTO coldfusiion.adbookcontacts(firstName,email)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.other.given_name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.other.given_email#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfset local.message  ="Invalid username or password">
            <cflocation  url="../auth/login.cfm?aMessages=#local.message#">  
        </cfif>
        <cfdump var =#res#>
    </cffunction>
</cfcomponent>


