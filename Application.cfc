<cfcomponent output="false">
    <cfset this.name ="addressBook">
    <cfset this.datasource = "cruddb"/>

    <cfset this.applicationTimeout = createTimespan(0,2,0,0)/>
    <cfset this.sessionManagement  = "true">
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)/>

    <cfset this.ormEnabled = true>
    <cfset this.ormSettings = { logsql : true }>

</cfcomponent>