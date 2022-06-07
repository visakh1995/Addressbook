<cfcomponent persistant ="true">
    <cffunction name="googleSignIn" access="remote">
        <cfoauth
            type="Google"
            clientid="675092712119-46rfgtbg4ph9dh0tlvepfphd6hr2fito.apps.googleusercontent.com"
            secretkey="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"
            result="res"
            scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
            redirecturi="http://127.0.0.1:8500/ADDRESSBOOK/components/userAuth.cfc?method=googleSignIn">

        <cfquery name="verifyGoogleDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            emailId = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#res.other.email#"> AND 
            password = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#res.id#"> 
        </cfquery>

        <cfif verifyGoogleDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifyGoogleDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifyGoogleDetails.fullName#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken ="no" url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfquery name="addGoogleData" result = result>
                INSERT INTO coldfusiion.addressbook_register(fullName,emailId,userName,password,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.other.email#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#res.id#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifyGoogleDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifyGoogleDetails.fullName#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken ="no"  url="../pages/dashboard.cfm">  
        </cfif>
    </cffunction>

    <cffunction name="facebookSignIn" access="remote">
        <cfoauth
            type="Facebook"
            clientid="737046567648705"
            secretkey="7c548f2b9f8bd5ffa36abba697a81254"
            result="resFb"
            redirecturi="http://localhost:8500/ADDRESSBOOK/components/userAuth.cfc?method=facebookSignIn">

        <cfquery name="verifyFacebookDetails">
            SELECT *FROM coldfusiion.addressbook_register WHERE 
            userName = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#resFb.id#">AND
            fullName = <cfqueryparam CFSQLType="cf_sql_varchar" value ="#resFb.name#">  
        </cfquery>
        <cfif verifyFacebookDetails.RecordCount gt 0>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifyFacebookDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifyFacebookDetails.fullName#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken ="no"  url="../pages/dashboard.cfm"> 
        <cfelse>
            <cfquery name="addFacebookData" result = result>
                INSERT INTO coldfusiion.addressbook_register(fullName,emailId,userName,password,status)
                VALUES(
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.name#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="facebook">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.id#">,
                    <cfqueryparam  CFSQLType="cf_sql_varchar" value="#resFb.access_token#">,
                    <cfqueryparam  CFSQLType="cf_sql_integer" value="1">
                )
            </cfquery>
            <cfif NOT structKeyExists(Session,"addressBookCredentials")>
                <cflock  timeout="20" scope="Session" type="Exclusive">
                    <cfset Session.addressBookCredentials = structNew()>
                </cflock>
            </cfif>
            <cfif structKeyExists(Session,"addressBookCredentials")>
                <cfset Session.addressBookCredentials["id"] = "#verifyFacebookDetails.id#">
                <cfset Session.addressBookCredentials["userName"] = "#verifyFacebookDetails.fullName#">
                <cfset Session.addressBookCredentials["isAuthenticated"] = "True">
            </cfif>
            <cflocation addtoken ="no"  url="../pages/dashboard.cfm">  
        </cfif>
    </cffunction>
</cfcomponent>




