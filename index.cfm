<cfif NOT isDefined("Session.addressBookCredentials")>
	<cflocation url="./auth/login.cfm" addtoken="no" /> 
<cfelse>
    <cflocation url="./pages/dashboard.cfm" addtoken="no" /> 
</cfif>




