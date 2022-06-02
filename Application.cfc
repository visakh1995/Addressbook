<cfcomponent output="false">
    <cfset this.name ="addressBook">
    <cfset this.datasource = "cruddb"/>

    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.sessionManagement  = "true">
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>

    <cfset this.ormEnabled = true>
    <cfset this.ormSettings = { 
        logsql : true,
        cflocation : ['cfc/contacts'],
        <!--- dbcreate : "update",  --->
        dialect : "org.hibernate.dialect.MySQL5Dialect",
        datasource : "cruddb",
        useDBForMapping : false
    }>

    <cffunction 
        name="OnApplicationStart" 
        access="public" 
        returnType="boolean" 
        output="false"
        hint="Fires when the application is first created.">
        
        <cfreturn true/>
    </cffunction>

    <cffunction 
        name="OnSessionStart"
        access="public"
        returnType="void"
        output="false"
        hint="Fires when the session is first created">

        <!---setting up cfid/cftoken as cookies,cz session ends on browser close --->
        <cfif not isDefined("Cookie.CFID")>
            <cflock scope="session" type = "readonly" timeout="5">
                <cfcookie name="CFID" value="#session.CFID#">
                <cfcookie name="CFTOKEN" value="#session.CFTOKEN#">
                <cfset session.SessionStartTime = Now() />
            </cflock>
        </cfif>
    </cffunction>

    <cffunction 
        name="OnRequestStart"
        access="public"
        returnType="void"
        output="false"
        hint ="request start">
    </cffunction>

    <cffunction 
        name="OnRequestEnd"
        access="public"
        returnType="void"
        output="false"
        hint ="request end">
    </cffunction>

    <cffunction 
        name="OnSessionEnd"
        access="public"
        returnType="void"
        output="false"
        hint ="session end">
    </cffunction>

    <cffunction 
        name="OnApplicationEnd"
        access="public"
        returnType="void"
        output="false"
        hint ="application end">
    </cffunction>


</cfcomponent>
