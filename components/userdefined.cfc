<cfcomponent>

    <cffunction  name="addressBookSignup" access="remote" output="true" returnType="string">
        
        <cfargument  name="fullName" type="string" required="yes">
        <cfargument  name="emailId" type="string" required="yes">
        <cfargument  name="userName" type="string" required="yes">
        <cfargument  name="password" type="string" required="yes">
        <cfargument  name="confirmPassword" type="string" required="yes">

        <cfset local.aErrorMessages =  "">
        <cfif arguments.fullName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid name'/>
        </cfif>
        <cfif arguments.emailId EQ '' OR NOT isValid("email",arguments.emailId)>
            <cfset local.aErrorMessages = 'Please provide valid email ID'/>
         </cfif>
        <cfif arguments.userName EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid user name'/>
        </cfif>
        <cfif arguments.password EQ ''>
            <cfset local.aErrorMessages = 'Please provide valid user name'/>
        </cfif>
        <cfif arguments.confirmPassword EQ ''>
            <cfset local.aErrorMessages = 'Confirm password field cant be empty'/>
        </cfif>
        <cflocation  url="../auth/signup.cfm?aMessages=#local.aErrorMessages#">

    </cffunction>
</cfcomponent>